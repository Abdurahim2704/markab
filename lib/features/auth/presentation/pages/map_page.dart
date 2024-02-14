import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markab/features/auth/data/services/map_services/yandex_map_service.dart';
import 'package:markab/features/auth/presentation/bloc/location/location_bloc.dart';
import 'package:markab/features/auth/presentation/widgets/menu_container.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapControllerCompleter = Completer<YandexMapController>();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    mapObject=[  PlacemarkMapObject(
        consumeTapEvents: true,
        onTap: (mapObject, point) {
         modalBottomSheet(context, "Bekzoda akaning dokoni");
        },
        text: PlacemarkText(text: "Bekzod aka", style: PlacemarkTextStyle()),

        mapId: const MapObjectId("Bekzod aka"),
        point: const Point(latitude: 42.1, longitude: 69.3),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
          scale: 2,
          image: BitmapDescriptor.fromAssetImage("assets/images/ic_locate.png"),
          rotationType: RotationType.rotate,
        ))),
      PlacemarkMapObject(
          consumeTapEvents: true,
          onTap: (mapObject, point) {
            modalBottomSheet(context, "Bekzoda tog'aning dokoni");
          },
          text: PlacemarkText(text: "Bekzod toga", style: PlacemarkTextStyle()),
          mapId: const MapObjectId("Bekzod toga"),
          point: const Point(latitude: 42.5, longitude: 69.7),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 2,
            image: BitmapDescriptor.fromAssetImage("assets/images/ic_locate.png"),
            rotationType: RotationType.rotate,
          ))),
      PlacemarkMapObject(
          consumeTapEvents: true,
          onTap: (mapObject, point) {
            modalBottomSheet(context, "Bekzod jiyanning dokoni");
          },
          text: PlacemarkText(text: "Bekzod jiyan", style: PlacemarkTextStyle()),

          mapId: const MapObjectId("Bekzod jiyan"),
          point: const Point(latitude: 41.9, longitude: 68.9),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 2,
            image: BitmapDescriptor.fromAssetImage("assets/images/ic_locate.png"),
            rotationType: RotationType.rotate,
          )))];
    super.initState();
    _initPermission().ignore();
  }

  List<MapObject> mapObject = [

  ];
  AppLatLong? currentLocation;

  @override
  Widget build(BuildContext context) {
    addObjects(appLatLong: currentLocation ?? const TashkentLocation());
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            nightModeEnabled: false,
            mapObjects: mapObject,
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
            onMapTap: (point) {
              addMark(point: point);
              BlocProvider.of<LocationBloc>(context).add(GetLocationEvent(
                  appLatLong: AppLatLong(
                lat: point.latitude,
                long: point.longitude,
              )));
            },
          ),
          BlocConsumer<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state is LocationSuccess) {
                modalBottomSheet(context,  state
                    .model
                    .response
                    .geoObjectCollection
                    .featureMember[0]
                    .geoObject
                    .metaDataProperty
                    .geocoderMetaData
                    .text);
              }
              if (state is LocationError) {
                controller.text = state.errorText;
              }
              setState(() {});
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    MenuContainer(
                      function: () {
                        if (state is LocationSuccess) {
                          String pos = state
                                  .model
                                  .response
                                  .geoObjectCollection
                                  .metaDataProperty
                                  .geocoderResponseMetaData
                                  .point
                                  ?.pos ??
                              "42 69";
                          addMark(
                              point: Point(
                                  latitude:
                                      double.tryParse(pos.split(" ")[1]) ?? 42,
                                  longitude:
                                      double.tryParse(pos.split(" ")[0]) ??
                                          69));
                        }
                      },
                      controller: controller,
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> modalBottomSheet(BuildContext context,String text) {
    return showModalBottomSheet(context: context, builder: (context) {
                return Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: Text(text
                     , style: TextStyle(
                    color: Colors.blue, fontSize: 18
                  ),
                  ),
                );
              },);
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = TashkentLocation();
    try {
      location = await LocationService().getCurrentLocation();
      currentLocation = location;
    } catch (_) {
      location = defLocation;
    }
    addObjects(appLatLong: location);
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 14,
        ),
      ),
    );
  }

  void addObjects({required AppLatLong appLatLong}) {
    final myLocationMarker = PlacemarkMapObject(
        mapId: const MapObjectId("currentLocationMark"),
        point: Point(
          latitude: appLatLong.lat,
          longitude: appLatLong.long,
        ),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image:
              BitmapDescriptor.fromAssetImage("assets/images/ic_current.png"),
          rotationType: RotationType.rotate,
        )));
    final currentLocationCircle = CircleMapObject(
        mapId: const MapObjectId("currentLocationCircle"),
        circle: Circle(
            center: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
            radius: 150),
        strokeWidth: 0,
        fillColor: Colors.yellow.withOpacity(0.2));
    mapObject.addAll([myLocationMarker, currentLocationCircle]);
    setState(() {});
  }

  void addMark({required Point point}) {
    final markLocation = PlacemarkMapObject(
      mapId: const MapObjectId("markId"),
      point: point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(
              "assets/images/ic_navigate.png",
            ),
            rotationType: RotationType.rotate,
            scale: 2,
            tappableArea: MapRect(
                min: Offset(point.latitude, point.longitude),
                max: Offset.zero)),
      ),
    );
    mapObject.add(markLocation);
    setState(() {});
  }
}

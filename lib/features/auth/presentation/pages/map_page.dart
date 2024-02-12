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
    super.initState();
    _initPermission().ignore();
  }

  List<MapObject> mapObject = [];
  AppLatLong? currentLocation;

  @override
  Widget build(BuildContext context) {
    addObjects(appLatLong: currentLocation ?? TashkentLocation());
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            nightModeEnabled: true,
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
                controller.text = state
                    .model
                    .response
                    .geoObjectCollection
                    .featureMember[0]
                    .geoObject
                    .metaDataProperty
                    .geocoderMetaData
                    .text;

              }
              if(state is LocationError){
                controller.text = state.errorText;
              }
              setState(() {

              });

            },
            builder: (context, state) {
              return Align(
                  alignment: Alignment(0, 0.8),
                  child: MenuContainer(
                    controller: controller,
                  ));
            },
          ),
        ],
      ),
    );
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

  Future<void> _moveToCurrentLocation(AppLatLong appLatLong,) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: MapAnimation(type: MapAnimationType.smooth, duration: 2),
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
        mapId: MapObjectId("currentLocationMark"),
        point: Point(
          latitude: appLatLong.lat,
          longitude: appLatLong.long,
        ),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage("assets/images/img.png"),
          rotationType: RotationType.rotate,
        )));
    final currentLocationCircle = CircleMapObject(
        mapId: MapObjectId("currentLocationCircle"),
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
        mapId: MapObjectId("markId"),
        point: point,
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage("assets/images/img.png"),
          rotationType: RotationType.rotate,
        )));
    mapObject.add(markLocation);
    setState(() {});
  }
}

import 'package:dio/dio.dart';
import 'package:markab/config/core/constants/app_conts.dart';

import '../../data/models/location_model.dart';
import '../../data/services/map_services/yandex_map_service.dart';

class LocationRepository {
  final Dio dio;

  LocationRepository({required this.dio});

  Future<LocationModel> getLocation({required AppLatLong appLatLong}) async {
    final response = await dio.get(
      "https://geocode-maps.yandex.ru/1.x/?apikey=${AppConsts.apiKey}&geocode=${appLatLong.long},${appLatLong.lat} &format=json",
    );
    return LocationModel.fromJson(response.data);
  }

  Future<LocationModel> getLocationByAddress({required String street}) async {
    final response = await dio.get(
        "https://geocode-maps.yandex.ru/1.x/?apikey=${AppConsts.apiKey}&geocode=$street &format=json");
    return LocationModel.fromJson(response.data);
  }
}

import 'package:geolocator/geolocator.dart';

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}

class AppLatLong {
  final double lat;
  final double long;
  final String? name;

  const AppLatLong({
    required this.lat,
    required this.long,
    this.name,
  });
}

class TashkentLocation extends AppLatLong {
  const TashkentLocation({
    super.lat = 42,
    super.long = 69,
  });
}

class LocationService implements AppLocation {
  final defLocation = const TashkentLocation();

  @override
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }

  @override
  Future<AppLatLong> getCurrentLocation() async {
    return Geolocator.getCurrentPosition().then((value) {
      return AppLatLong(
        lat: value.latitude,
        long: value.longitude,
      );
    }).catchError(
      (_) => defLocation,
    );
  }

  @override
  Future<bool> requestPermission() {
    return Geolocator.requestPermission()
        .then((value) =>
            value == LocationPermission.always ||
            value == LocationPermission.whileInUse)
        .catchError((_) => false);
  }
}

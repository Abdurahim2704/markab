import 'dart:convert';

import 'package:markab/features/auth/domain/entities/location.dart';

class Location extends LocationEntity {
  Location({
    required super.latitude,
    required super.longitude,
  });

  factory Location.fromJson(Map<String, Object?> json) {
    final latitude = double.parse(json["latitude"] as String);
    final longitude = double.parse(json["latitude"] as String);

    return Location(latitude: latitude, longitude: longitude);
  }

  String toJson() {
    return jsonEncode(
      {
        "latitude": latitude,
        "longitude": longitude,
      },
    );
  }
}

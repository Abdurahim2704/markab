import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double longitude;
  final double latitude;

  const LocationEntity({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];
}

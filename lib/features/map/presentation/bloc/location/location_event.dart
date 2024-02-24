part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class GetLocationEvent extends LocationEvent{
final AppLatLong appLatLong;
GetLocationEvent({required this.appLatLong});
}


class GetLocationByAddressEvent extends LocationEvent{
  final String address;
  GetLocationByAddressEvent({required this.address});
}
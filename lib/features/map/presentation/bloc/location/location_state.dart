part of 'location_bloc.dart';

@immutable
abstract class LocationState {
}

class LocationInitial extends LocationState {}
class LocationILoading extends LocationState {}
class LocationSuccess extends LocationState {
  final LocationModel model;
  LocationSuccess({required this.model});
}
class LocationError extends LocationState {
  final String errorText;
  LocationError({required this.errorText});
}

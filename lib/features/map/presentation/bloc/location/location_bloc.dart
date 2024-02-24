import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:markab/features/map/domain/repository/location_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/location_model.dart';
import '../../../data/services/map_services/yandex_map_service.dart';

part 'location_event.dart';

part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({required this.repository}) : super(LocationInitial()) {
    on<GetLocationEvent>(_getLocation);
    on<GetLocationByAddressEvent>(_getLocationByAddress);
  }

  void _getLocation(GetLocationEvent event, Emitter emit) async {
    emit(LocationILoading());
    try {
      final model = await repository.getLocation(appLatLong: event.appLatLong);

      emit(LocationSuccess(
        model: model,
      ));
    } catch (e) {
      if (e is DioException) {
        emit(LocationError(
          errorText: e.response?.data.toString() ?? "",
        ));
      } else {
        emit(LocationError(
          errorText: e.toString(),
        ));
      }
    }
  }

  void _getLocationByAddress(
      GetLocationByAddressEvent event, Emitter emit) async {
    emit(LocationILoading());
    final model = await repository.getLocationByAddress(street: event.address);
    try {
      emit(LocationSuccess(
        model: model,
      ));
    } catch (e) {
      if (e is DioException) {
        emit(LocationError(
          errorText: e.response?.data.toString() ?? "",
        ));
      } else {
        emit(LocationError(
          errorText: e.toString(),
        ));
      }
    }
  }

  final LocationRepository repository;
}

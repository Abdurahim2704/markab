import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:markab/features/auth/data/models/location_model.dart';
import 'package:markab/features/auth/data/services/map_services/yandex_map_service.dart';
import 'package:markab/features/auth/domain/repository/location_repository.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc({required this.repository}) : super(LocationInitial()) {
    on<GetLocationEvent>(_getLocation);
  }
  void _getLocation(GetLocationEvent event, Emitter emit) async{
    final model = await repository.getLocation(appLatLong: event.appLatLong);
    emit(LocationILoading());
    try{


      emit(LocationSuccess(model: model));
    }
    catch(e){
      if(e is DioException){
        emit(LocationError(errorText: e.response?.data.toString()??""));
      }
      else{
        emit(LocationError(errorText: e.toString()));
      }  print("-----------------------------------------------------------");
      print(model);
    }
  }
  final LocationRepository repository;
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MyGlobalObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint(
        "${bloc.runtimeType} State: ${bloc.state.runtimeType} Event: ${event.runtimeType}");
  }
}

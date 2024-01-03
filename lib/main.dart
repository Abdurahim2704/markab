import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:markab/app.dart';
import 'package:markab/observer.dart';

import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  Bloc.observer = MyGlobalObserver();
  runApp(const MarkabApp());
}

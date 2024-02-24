import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:markab/app.dart';
import 'package:markab/observer.dart';

import 'features/auth/data/models/location.dart';
import 'features/auth/data/models/mechanic.dart';
import 'locator.dart';

final master = Mechanic(
  userId: 1,
  location: Location(latitude: 3.2, longitude: 4.2),
  id: 1,
  name: "Jumayev Firdavs",
  grade: 3,
  about: "Men yaxshi dasturchiman hozir TATUda o'qiyman",
  address: "Mening adresim Yunusobod 9",
  phoneNumbers: [
    "+998905486416",
    "+998930806416",
  ],
  skills: [
    "dasturlash",
    "payvandalsh",
    "ovqat qilish",
    "o'qish",
    "fizika",
    "matematika",
    "dasturlash",
    "payvandalsh",
    "ovqat qilish",
    "o'qish",
    "fizika",
    "matematika",
    "dasturlash",
    "payvandalsh",
    "ovqat qilish",
    "o'qish",
    "fizika",
    "matematika",
  ],
  image: "https://via.placeholder.com/126x126",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  Bloc.observer = MyGlobalObserver();
  runApp(const MarkabApp());
}

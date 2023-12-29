import 'dart:convert';

import 'package:markab/features/auth/domain/entities/user.dart';

class User extends UserEntity {
  const User({
    required super.id,
    required super.role,
    required super.phoneNumber,
    required super.carNumber,
  });

  factory User.fromJson(Map<String, Object?> json) {
    final id = json["id"] as int;
    final role =
        (json["role"] as String) == "master" ? Role.master : Role.driver;
    final phoneNumber = json["phone_number"] as String;
    final carNumber = json["car_number"] as String?;

    return User(
        id: id, role: role, phoneNumber: phoneNumber, carNumber: carNumber);
  }

  String toJson() {
    return jsonEncode({
      "role": role.name,
      "id": id,
      "phone_number": phoneNumber,
      "car_number": carNumber,
    });
  }
}

import 'package:markab/features/auth/domain/entities/location.dart';

class MechanicEntity {
  final int id;
  final int userId;
  final String name;
  final double grade;
  final LocationEntity location;
  final String about;
  List<String> skills;
  final String address;
  final String? image;

  MechanicEntity({
    required this.userId,
    required this.location,
    required this.id,
    List<String> skills = const [],
    required this.name,
    required this.grade,
    required this.about,
    required this.address,
    required this.image,
  }) : skills = skills.toSet().toList();
}

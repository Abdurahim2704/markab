import 'package:markab/features/auth/domain/entities/location.dart';

class MechanicEntity {
  final int id;
  final int userId;
  final LocationEntity location;
  List<String> skills;

  MechanicEntity({
    required this.userId,
    required this.location,
    required this.id,
    this.skills = const [],
  });
}

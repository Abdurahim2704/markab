import 'package:markab/features/auth/domain/entities/location.dart';

class MechanicEntity {
  final int userId;
  final LocationEntity location;
  List<String> skills;

  MechanicEntity({
    required this.userId,
    required this.location,
    this.skills = const [],
  });
}

import 'package:markab/features/auth/data/models/location.dart';
import 'package:markab/features/auth/domain/entities/mechanic.dart';

class Mechanic extends MechanicEntity {
  Mechanic({
    required super.userId,
    required super.location,
    required super.id,
  });

  factory Mechanic.fromJson(Map<String, Object?> json) {
    final userId = json["userId"] as int;
    final location =
        Location.fromJson(json["location"] as Map<String, Object?>);
    final int id = json["id"] as int;

    return Mechanic(userId: userId, location: location, id: id);
  }
}

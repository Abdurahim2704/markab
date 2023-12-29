import 'package:markab/features/auth/data/models/location.dart';
import 'package:markab/features/auth/domain/entities/mechanic.dart';

class Mechanic extends MechanicEntity {
  Mechanic({
    required super.userId,
    required super.location,
  });

  factory Mechanic.fromJson(Map<String, Object?> json) {
    final userId = json["userId"] as int;
    final location =
        Location.fromJson(json["location"] as Map<String, Object?>);

    return Mechanic(userId: userId, location: location);
  }
}

import 'package:markab/features/auth/data/models/location.dart';
import 'package:markab/features/auth/domain/entities/mechanic.dart';

class Mechanic extends MechanicEntity {
  Mechanic({
    required super.userId,
    required super.location,
    required super.id,
    required super.name,
    required super.grade,
    required super.about,
    required super.address,
    required super.image,
    required super.phoneNumbers,
    super.skills,
  });

  factory Mechanic.fromJson(Map<String, Object?> json) {
    final userId = json["userId"] as int;
    final location =
        Location.fromJson(json["location"] as Map<String, Object?>);
    final int id = json["id"] as int;
    final String name = json["name"] as String;
    final grade = json["grade"] as double;
    final about = json["about"] as String;
    final address = json["address"] as String;
    final image = json["image"] as String?;
    final phoneNumbers =
        (json["phoneNumbers"] as List).map((e) => e as String).toList();

    return Mechanic(
        userId: userId,
        location: location,
        id: id,
        name: name,
        grade: grade,
        about: about,
        address: address,
        image: image,
        phoneNumbers: phoneNumbers);
  }
}

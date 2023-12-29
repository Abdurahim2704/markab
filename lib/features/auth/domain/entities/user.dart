//Bu yerda hujjatlari ham offlayn bo'lishi mumkin
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final Role role;
  final String phoneNumber;
  final String? carNumber;

  const UserEntity(
      {required this.id,
      required this.role,
      required this.phoneNumber,
      required this.carNumber});

  @override
  List<Object?> get props => [id];
}

enum Role {
  master,
  driver,
}

import 'package:markab/features/auth/domain/entities/user.dart';
import 'package:markab/features/auth/domain/repository/auth_repository.dart';

class AuthImpl extends AuthRepository {
  @override
  Future<UserEntity> signIn(String phoneNumber, String carNumber) async {
    return UserEntity(
        id: 1,
        role: Role.driver,
        phoneNumber: phoneNumber,
        carNumber: carNumber);
  }
  @override
  Future<UserEntity> signUp(
      String phoneNumber, String carNumber, Role role) async {
    await sendVerification(phoneNumber);
    return UserEntity(
        id: 2, role: role, phoneNumber: phoneNumber, carNumber: carNumber);
  }

  @override
  Future<int?> sendVerification(String phoneNumber) async {
    return 1235;
  }
}

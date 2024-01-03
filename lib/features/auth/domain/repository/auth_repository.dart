import '../entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> signUp(String phoneNumber, String carNumber, Role role);
  Future<UserEntity> signIn(String phoneNumber, String carNumber);
  Future<int?> sendVerification(String phoneNumber);
}

import 'package:markab/features/auth/data/services/auth_service.dart';
import 'package:markab/features/auth/domain/repository/auth_repository.dart';
import 'package:markab/locator.dart';

Future<void> authSetUp() async {
  getIt.registerSingleton<AuthRepository>(AuthImpl());
}

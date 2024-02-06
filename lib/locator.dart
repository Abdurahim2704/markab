import 'package:get_it/get_it.dart';
import 'package:markab/features/auth/set_up.dart';
import 'package:markab/features/card/data/service/bank_service.dart';
import 'package:markab/features/card/domain/repositories/bank_repository.dart';

final getIt = GetIt.instance;
Future<void> setUp() async {
  await authSetUp();
  getIt.registerSingleton<BankRepository>(BankService());
}

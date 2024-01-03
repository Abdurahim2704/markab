import 'package:get_it/get_it.dart';
import 'package:markab/features/auth/set_up.dart';

final getIt = GetIt.instance;
Future<void> setUp() async {
  await authSetUp();
}

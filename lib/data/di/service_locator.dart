import 'package:get_it/get_it.dart';
import '/data/network/api/ask_cody_api.dart';
import '/data/repositories/ask_cody_repository.dart';
import '/data/network/api/auth_api.dart';
import '/data/repositories/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(AuthApi());
  getIt.registerSingleton(AuthRepository(getIt.get<AuthApi>()));
  getIt.registerSingleton(AskCodyApi());
  getIt.registerSingleton(AskCodyRepository(getIt.get<AskCodyApi>()));
}
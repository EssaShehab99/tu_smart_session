import 'package:get_it/get_it.dart';
import 'package:tu_smart_session/data/network/api/places_api.dart';
import 'package:tu_smart_session/data/repositories/place_repository.dart';
import '/data/network/api/advisor_api.dart';
import '/data/network/api/ask_cody_api.dart';
import '/data/repositories/advisor_repository.dart';
import '/data/repositories/ask_cody_repository.dart';
import '/data/network/api/auth_api.dart';
import '/data/repositories/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(AuthApi());
  getIt.registerSingleton(AuthRepository(getIt.get<AuthApi>()));
  getIt.registerSingleton(AskCodyApi());
  getIt.registerSingleton(AskCodyRepository(getIt.get<AskCodyApi>()));
  getIt.registerSingleton(AdvisorApi());
  getIt.registerSingleton(AdvisorRepository(getIt.get<AdvisorApi>()));
  getIt.registerSingleton(PlaceApi());
  getIt.registerSingleton(PlaceRepository(getIt.get<PlaceApi>()));
}
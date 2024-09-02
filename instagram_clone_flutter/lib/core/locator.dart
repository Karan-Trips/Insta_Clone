import 'package:get_it/get_it.dart';

import '../instagram/authStore/auth_store.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<MainStore>(() => MainStore());
}

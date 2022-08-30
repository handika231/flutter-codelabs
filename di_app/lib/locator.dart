import 'package:di_app/data/cat_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'presentation/provider/cat_provider.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<CatProvider>(() => CatProvider(locator()));
  locator.registerLazySingleton<CatRepository>(() => CatRepository(locator()));
  locator.registerLazySingleton<Client>(() => Client());
}

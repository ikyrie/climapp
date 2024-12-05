import 'package:climapp/app/adapters/http_adapter.dart';
import 'package:climapp/app/service/weather_service.dart';
import 'package:climapp/app/store/weather_store.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<IHttpClient>(() => HttpAdapter(http.Client()));
  locator.registerLazySingleton(() => WeatherService(locator.get<IHttpClient>()));
  locator.registerLazySingleton(() => WeatherStore());
}

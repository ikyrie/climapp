import 'package:climapp/app/injection/injection_container.dart';
import 'package:climapp/app/models/weather_model.dart';
import 'package:climapp/app/service/weather_service.dart';
import 'package:get_it/get_it.dart';

void main() async {
  setupLocator();
  final GetIt locator = GetIt.instance;
  final WeatherService service = locator.get<WeatherService>();
  final WeatherModel response = await service.getWeatherByCity("Toledo");
  print(response.cityName);
}

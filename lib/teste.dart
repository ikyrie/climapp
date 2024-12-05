import 'package:climapp/app/models/weather_model.dart';
import 'package:climapp/app/service/weather_service.dart';

main() async {
  final weatherService = WeatherService();
  final WeatherModel weather = await weatherService.getWeatherByCity("São José dos Campos");
  print(weather.forecast[0].max);
}

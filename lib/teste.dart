import 'package:climapp/app/service/weather_service.dart';

main() async {
  final weatherService = WeatherService();
  final weather = await weatherService.getWeatherByCity("São José dos Campos");
  print(weather);
}

import 'dart:convert';
import 'package:climapp/app/adapters/http_adapter.dart';
import 'package:climapp/app/consts/enums.dart';
import 'package:climapp/app/models/weather_model.dart';
// flutter run --dart-define=MY_VAR=chave


class WeatherService {
  final IHttpClient httpClient;
  final enumEnv = WeatherServiceConfig.production;

  WeatherService(this.httpClient);

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await httpClient.get(
        '${enumEnv.baseUrl}?key=${enumEnv.apiKey}&city_name=$city&unit=metric',
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body)['results']);
      } else {
        throw Exception('Falha ao carregar dados do clima');
      }
    } catch (e) {
      throw Exception('Erro na comunicação com a API: $e');
    }
  }
}

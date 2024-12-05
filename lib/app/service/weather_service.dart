import 'dart:convert';
import 'package:climapp/app/consts/enums.dart';
import 'package:climapp/app/models/weather_model.dart';
import 'package:http/http.dart' as http;
// flutter run --dart-define=MY_VAR=chave

class WeatherService {
  final enumEnv = WeatherServiceConfig.production;

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await http.get(
        Uri.parse('${enumEnv.baseUrl}?key=${enumEnv.apiKey}&city_name=$city&unit=metric'),
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

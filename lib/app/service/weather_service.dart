import 'dart:convert';
import 'package:climapp/app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _baseUrl = 'https://api.hgbrasil.com/weather';
  static const String _apiKey = '4a661815'; // Substitua pela sua chave da API HG Brasil

  Future<WeatherModel> getWeatherByCity(String city) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?key=$_apiKey&city_name=$city&unit=metric'),
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

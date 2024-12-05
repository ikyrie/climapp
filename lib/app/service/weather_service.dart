import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _baseUrl = 'https://api.hgbrasil.com/weather';
  static const String _apiKey = '4a661815'; // Substitua pela sua chave da API HG Brasil

  Future<Map<String, dynamic>> getWeatherByCity(String city) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?key=$_apiKey&city_name=$city&unit=metric'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Falha ao carregar dados do clima');
      }
    } catch (e) {
      throw Exception('Erro na comunicação com a API: $e');
    }
  }

  Future<Map<String, dynamic>> getWeatherByLocation(double lat, double lon) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?key=$_apiKey&lat=$lat&lon=$lon'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Falha ao carregar dados do clima');
      }
    } catch (e) {
      throw Exception('Erro na comunicação com a API: $e');
    }
  }
}

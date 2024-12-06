import 'dart:convert';

import 'package:climapp/app/adapters/http_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:climapp/app/models/weather_model.dart';
import 'package:climapp/app/service/weather_service.dart';


@GenerateNiceMocks([MockSpec<IHttpClient>()])
import 'weather_service_test.mocks.dart';
void main() {
  group('WeatherService', () {
    late WeatherService weatherService;
    late MockIHttpClient mockHttpClient;
    late String mockResponse;

    setUp(() {
      mockHttpClient = MockIHttpClient();
      weatherService = WeatherService(mockHttpClient);
      mockResponse = jsonEncode({ "by":"city_name", "valid_key":true, "results":{ "temp":22, "date":"05/12/2024", "time":"10:09", "condition_code":"28", "description":"Tempo nublado", "currently":"dia", "cid":"", "city":"São José dos Campos, SP", "img_id":"28", "humidity":83, "cloudiness":100, "rain":0, "wind_speedy":"2.06 km/h", "wind_direction":30, "wind_cardinal":"NE", "sunrise":"05:09 am", "sunset":"06:39 pm", "moon_phase":"waxing_crescent", "condition_slug":"cloudly_day", "city_name":"São José dos Campos", "timezone":"-03:00", "forecast":[ { "date":"05/12", "weekday":"Qui", "max":27, "min":18, "humidity":69, "cloudiness":100, "rain":12.4, "rain_probability":100, "wind_speedy":"2.3 km/h", "sunrise":"05:09 am", "sunset":"06:39 pm", "moon_phase":"waxing_crescent", "description":"Chuva", "condition":"rain" } ], "cref":"f20fed" }, "execution_time":0.01, "from_cache":false });

    });

    test('deve retornar WeatherModel quando a resposta for bem-sucedida', () async {
      // Arrange
      final city = 'São Paulo';
      when(mockHttpClient.get(any)).thenAnswer((_) async => Response(mockResponse, 200));

      // Act
      final result = await weatherService.getWeatherByCity(city);

      // Assert
      expect(result, isA<WeatherModel>());
      expect(result.temp, 22);
    });

    test('deve lançar uma exceção quando a resposta não for 200', () async {
      // Arrange
      final city = 'São Paulo';
      when(mockHttpClient.get(any)).thenAnswer((_) async => Response('', 400));

      // Act & Assert
      expect(() async => await weatherService.getWeatherByCity(city), throwsException);
    });

    test('deve lançar uma exceção em caso de erro de comunicação', () async {
      // Arrange
      final city = 'São Paulo';
      when(mockHttpClient.get(any)).thenThrow(Exception('Erro de rede'));

      // Act & Assert
      expect(() async => await weatherService.getWeatherByCity(city), throwsException);
    });
  });
}

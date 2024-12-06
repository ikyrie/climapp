import 'package:climapp/app/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherModel', () {
    late Map<String, dynamic> mockResponse;
    setUp(() {
      mockResponse = { "temp":22, "date":"05/12/2024", "time":"10:09", "condition_code":"28", "description":"Tempo nublado", "currently":"dia", "cid":"", "city":"São José dos Campos, SP", "img_id":"28", "humidity":83, "cloudiness":100, "rain":0, "wind_speedy":"2.06 km/h", "wind_direction":30, "wind_cardinal":"NE", "sunrise":"05:09 am", "sunset":"06:39 pm", "moon_phase":"waxing_crescent", "condition_slug":"cloudly_day", "city_name":"São José dos Campos", "timezone":"-03:00", "forecast":[ { "date":"05/12", "weekday":"Qui", "max":27, "min":18, "humidity":69, "cloudiness":100, "rain":12.4, "rain_probability":100, "wind_speedy":"2.3 km/h", "sunrise":"05:09 am", "sunset":"06:39 pm", "moon_phase":"waxing_crescent", "description":"Chuva", "condition":"rain" } ], "cref":"f20fed" };
    });
    test('deve criar uma instância a partir de JSON', () {
      final weatherModel = WeatherModel.fromJson(mockResponse);

      expect(weatherModel.temp, 22);
      expect(weatherModel.date, '05/12/2024');
      expect(weatherModel.conditionCode, '28');
    });

    test('deve lançar uma exceção se o JSON estiver incompleto', () {
      final json = {
        'temp': 25,
      };

      expect(() => WeatherModel.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}

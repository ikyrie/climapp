import 'package:climapp/app/models/forecast_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Forecast', () {
    late Map<String, dynamic> mockResponse;
    setUp(() {
      mockResponse = {
        "date": "05/12",
        "weekday": "Qui",
        "max": 27,
        "min": 18,
        "humidity": 69,
        "cloudiness": 100,
        "rain": 12.4,
        "rain_probability": 100,
        "wind_speedy": "2.3 km/h",
        "sunrise": "05:09 am",
        "sunset": "06:39 pm",
        "moon_phase": "waxing_crescent",
        "description": "Chuva",
        "condition": "rain"
      };
    });
    test('fromJson creates a Forecast object from JSON', () {
      final forecast = Forecast.fromJson(mockResponse);

      expect(forecast.date, '05/12');
      expect(forecast.weekday, 'Qui');
      expect(forecast.max, 27);
      expect(forecast.min, 18);
      expect(forecast.humidity, 69);
      expect(forecast.cloudiness, 100.0);
      expect(forecast.rain, 12.4);
      expect(forecast.rainProbability, 100);
      expect(forecast.windSpeedy, '2.3 km/h');
      expect(forecast.sunrise, '05:09 am');
      expect(forecast.sunset, '06:39 pm');
      expect(forecast.moonPhase, 'waxing_crescent');
      expect(forecast.description, 'Chuva');
      expect(forecast.condition, 'rain');
    });

    test('fromJson handles null values', () {
      final json = {
        'date': null,
        'weekday': null,
        'max': null,
        'min': null,
        'humidity': null,
        'cloudiness': null,
        'rain': null,
        'rain_probability': null,
        'wind_speedy': null,
        'sunrise': null,
        'sunset': null,
        'moon_phase': null,
        'description': null,
        'condition': null,
      };

      expect(() => Forecast.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('fromJson handles missing fields', () {
      final json = {
        'date': '2023-10-01',
        // 'weekday' is missing
        'max': 30,
        'min': 20,
        'humidity': 80,
        'cloudiness': 0.5,
        'rain': 0.0,
        'rain_probability': 20,
        'wind_speedy': '10 km/h',
        'sunrise': '06:00',
        'sunset': '18:00',
        'moon_phase': 'Waxing Crescent',
        'description': 'Clear sky',
        'condition': 'Clear',
      };

      expect(() => Forecast.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}

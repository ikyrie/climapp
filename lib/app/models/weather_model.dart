class WeatherModel {
  final int temp;
  final String date;
  final String time;
  final String conditionCode;
  final String description;
  final String currently;
  final String city;
  final String imgId;
  final int humidity;
  final double cloudiness;
  final double rain;
  final String windSpeedy;
  final int windDirection;
  final String windCardinal;
  final String sunrise;
  final String sunset;
  final String moonPhase;
  final String conditionSlug;
  final String cityName;
  final String timezone;
  final List<Forecast> forecast;

  WeatherModel({
    required this.temp,
    required this.date,
    required this.time,
    required this.conditionCode,
    required this.description,
    required this.currently,
    required this.city,
    required this.imgId,
    required this.humidity,
    required this.cloudiness,
    required this.rain,
    required this.windSpeedy,
    required this.windDirection,
    required this.windCardinal,
    required this.sunrise,
    required this.sunset,
    required this.moonPhase,
    required this.conditionSlug,
    required this.cityName,
    required this.timezone,
    required this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['temp'],
      date: json['date'],
      time: json['time'],
      conditionCode: json['condition_code'],
      description: json['description'],
      currently: json['currently'],
      city: json['city'],
      imgId: json['img_id'].toString(),
      humidity: json['humidity'],
      cloudiness: json['cloudiness'].toDouble(),
      rain: json['rain'].toDouble(),
      windSpeedy: json['wind_speedy'],
      windDirection: json['wind_direction'],
      windCardinal: json['wind_cardinal'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonPhase: json['moon_phase'],
      conditionSlug: json['condition_slug'],
      cityName: json['city_name'],
      timezone: json['timezone'],
      forecast: (json['forecast'] as List)
          .map((item) => Forecast.fromJson(item))
          .toList(),
    );
  }
}

class Forecast {
  final String date;
  final String weekday;
  final int max;
  final int min;
  final int humidity;
  final double cloudiness;
  final double rain;
  final int rainProbability;
  final String windSpeedy;
  final String sunrise;
  final String sunset;
  final String moonPhase;
  final String description;
  final String condition;

  Forecast({
    required this.date,
    required this.weekday,
    required this.max,
    required this.min,
    required this.humidity,
    required this.cloudiness,
    required this.rain,
    required this.rainProbability,
    required this.windSpeedy,
    required this.sunrise,
    required this.sunset,
    required this.moonPhase,
    required this.description,
    required this.condition,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: json['date'],
      weekday: json['weekday'],
      max: json['max'],
      min: json['min'],
      humidity: json['humidity'],
      cloudiness: json['cloudiness'].toDouble(),
      rain: json['rain'].toDouble(),
      rainProbability: json['rain_probability'],
      windSpeedy: json['wind_speedy'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      moonPhase: json['moon_phase'],
      description: json['description'],
      condition: json['condition'],
    );
  }
}

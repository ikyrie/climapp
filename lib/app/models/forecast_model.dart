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

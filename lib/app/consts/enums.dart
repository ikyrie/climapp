enum WeatherServiceConfig {
  production(
      baseUrl: 'https://api.hgbrasil.com/weather',
      apiKey: String.fromEnvironment("API_KEY")),
  development(
      baseUrl: 'https://api.hgbrasil.com/weather',
      apiKey: String.fromEnvironment("API_KEY"));

  final String baseUrl;
  final String apiKey;
  const WeatherServiceConfig({required this.baseUrl, required this.apiKey});
}

const String imageUrl = 'https://assets.hgbrasil.com/weather/icons/conditions/';
const String moonPhaseUrl = 'https://assets.hgbrasil.com/weather/icons/moon/';

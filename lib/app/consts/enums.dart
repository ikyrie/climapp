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

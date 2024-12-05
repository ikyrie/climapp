import 'package:climapp/app/models/weather_model.dart';
import 'package:climapp/app/service/weather_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  final GetIt locator = GetIt.instance;
  // Observables
  @observable
  ObservableList<WeatherModel> weatherList = ObservableList<WeatherModel>();

  // Actions
  @action
  Future<void> fetchWeatherByCity(String city) async {
    final weatherService = locator<WeatherService>();
    final weather = await weatherService.getWeatherByCity(city);
    weatherList.add(weather);
  }

}

import 'package:climapp/app/models/weather_model.dart';
import 'package:climapp/ui/components/weather_card.dart';
import 'package:climapp/utils/colors.dart';
import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(weather.city),
      ),
      body: Ink(
        padding: const EdgeInsets.fromLTRB(32, 128, 32, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradiente,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: <Widget>[
            DetailedWeatherCard(weather: weather,),
            const SizedBox(height: 40,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                VerticalWeatherCard(weekDay: "Segunda", temperature: "25°", date: "03/12"),
                VerticalWeatherCard(weekDay: "Segunda", temperature: "25°", date: "03/12"),
                VerticalWeatherCard(weekDay: "Segunda", temperature: "25°", date: "03/12"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

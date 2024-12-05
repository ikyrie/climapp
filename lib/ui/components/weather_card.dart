import 'package:climapp/app/models/weather_model.dart';
import 'package:climapp/utils/colors.dart';
import 'package:climapp/utils/theme.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather, required this.onTap});

  final WeatherModel weather;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        onTap: () { onTap(); },
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: fillTransparente,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(Icons.sunny),
              Text(weather.city),
              Text(weather.temp.toString(), style: extraLargeBold,),
            ],
          ),
        ),
      ),
    );
  }
}


class VerticalWeatherCard extends StatelessWidget {
  const VerticalWeatherCard({super.key, required this.weekDay, required this.temperature, required this.date});

  final String weekDay;
  final String date;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: fillTransparente,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(weekDay),
            const SizedBox(height: 4,),
            Text(date),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.sunny),
            ),
            Text(temperature, style: largeSemibold,),
          ],
        ),
      ),
    );
  }
}

class DetailedWeatherCard extends StatelessWidget {
  const DetailedWeatherCard({super.key, required this.weather});

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: violetaHover,
      ),
      child: Column(
        children: <Widget>[
          Text("Hoje ${weather.date}", style: mediumSemibold,),
          const SizedBox(height: 24,),
          const Icon(Icons.sunny, size: 64,),
          Text("${weather.temp}°", style: extraLargeBold.copyWith(fontSize: 42),),
          Text(weather.description),
          const SizedBox(height: 24,),
          Row(
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(image: AssetImage("assets/img/water_drop.png"), alignment: Alignment.center),
                ),
              ),
              const Text("Umidade:", style: mediumSemibold,),
              Expanded(
                child: Text(
                  "${weather.humidity}%",
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8,),
          Row(
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(image: AssetImage("assets/img/device_thermostat.png"), alignment: Alignment.center),
                ),
              ),
              const Text("Min/Max:", style: mediumSemibold,),
              Expanded(
                child: Text("${weather.forecast[0].min}/${weather.forecast[0].max}°", textAlign: TextAlign.right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:climapp/utils/colors.dart';
import 'package:climapp/utils/theme.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.cityName, required this.temperature, required this.onTap});

  final String cityName;
  final String temperature;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
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
              Text(cityName),
              Text(temperature, style: extraLargeBold,),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:climapp/ui/components/custom_field.dart';
import 'package:climapp/ui/components/weather_card.dart';
import 'package:climapp/utils/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        padding: const EdgeInsets.fromLTRB(32, 80, 32, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradiente,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: <Widget>[
            CustomSearchField(controller: cityTextController),
            WeatherCard(cityName: "Floripas", temperature: "25°", onTap: (){},),
          ],
        ),
      ),
    );
  }
}

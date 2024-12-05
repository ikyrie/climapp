import 'package:climapp/app/store/weather_store.dart';
import 'package:climapp/ui/components/custom_field.dart';
import 'package:climapp/ui/components/weather_card.dart';
import 'package:climapp/ui/screens/details.dart';
import 'package:climapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController cityTextController = TextEditingController();
  final WeatherStore weatherStore = GetIt.instance.get<WeatherStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(32, 80, 32, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: gradiente,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomSearchField(controller: cityTextController),
              const SizedBox(height: 32,),
              WeatherCard(cityName: "Florianópolis - SC", temperature: "25°", onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherDetails(cityName: "Florianópolis - SC")));},),
              WeatherCard(cityName: "Curitiba - PR", temperature: "21°", onTap: (){},),
              WeatherCard(cityName: "São Paulo - SP", temperature: "32°", onTap: (){},),
              WeatherCard(cityName: "Porto Alegre - RS", temperature: "19°", onTap: (){},),
              WeatherCard(cityName: "Toledo - PR", temperature: "26°", onTap: (){},),
            ],
          ),
        ),
      ),
    );
  }
}

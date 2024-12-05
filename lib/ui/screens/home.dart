import 'package:climapp/app/store/weather_store.dart';
import 'package:climapp/ui/components/custom_field.dart';
import 'package:climapp/ui/components/weather_card.dart';
import 'package:climapp/ui/screens/details.dart';
import 'package:climapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: CustomSearchField(controller: cityTextController, onEditingComplete: () {weatherStore.fetchWeatherByCity(cityTextController.text);}),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 32,),),
          Observer(
            builder: (context) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final weather = weatherStore.weatherList[index];
                    return WeatherCard(weather: weather, onTap: (){},);
                  },
                  childCount: weatherStore.weatherList.length,
                ),
              );
            },
          ),          ],
        ),
        ),
    );
  }
}

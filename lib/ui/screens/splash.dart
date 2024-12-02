import 'package:climapp/utils/colors.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: gradiente, begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Image.asset("assets/img/logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 64),
              child: Image.asset("assets/img/home_logo.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: Text("Boas-vindas!"),
            ),
            InkWell(
              onTap: () {},
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  color: violetaDestaque,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text("Entrar", style: TextStyle(color: azulVoid,),),
                    ),
                    Icon(Icons.arrow_forward, color: azulVoid,),
                  ],
                ),
              ),
            ),
          ],
                ),
      ),
    );
  }
}

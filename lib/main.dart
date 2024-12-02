import 'package:flutter/material.dart';

void main() {
  runApp(Climapp());
}


class Climapp extends StatelessWidget {
  const Climapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Climapp",
      home: Scaffold(body: Center(child: Text("Climapp"),),),
    );
  }
}

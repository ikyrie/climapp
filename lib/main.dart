import 'package:climapp/app/app.dart';
import 'package:climapp/app/injection/injection_container.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(Climapp());
}

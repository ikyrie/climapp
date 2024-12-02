import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueGrey,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.montserrat(),
  ),
);

const TextStyle extraLarge = TextStyle(
  fontSize: 25,
);

const TextStyle largeSemibold = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

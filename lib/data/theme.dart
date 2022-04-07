import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
          .copyWith(primary: Colors.blueGrey)
          .copyWith(secondary: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.blueGrey,
          fontSize: 26,
          fontWeight: FontWeight.normal,
          fontFamily: 'Orbitron',
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.normal,
          fontFamily: 'Orbitron',
        ),
        bodyText1: TextStyle(
          color: Colors.blueGrey,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        bodyText2: TextStyle(
          color: Colors.blueGrey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        caption: TextStyle(
          color: Colors.blueGrey,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        overline: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        button: TextStyle(
          color: Colors.blueGrey,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}

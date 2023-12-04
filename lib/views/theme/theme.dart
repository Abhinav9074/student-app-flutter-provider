import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    ));

class MyTextStyle {
  static const TextStyle horizontalScrollerTextStyle = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 17,
      fontWeight: FontWeight.w900,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

  static const TextStyle primeText = TextStyle(
      color: Color.fromARGB(255, 19, 115, 193),
      fontSize: 17,
      fontWeight: FontWeight.w900,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

  static const TextStyle appBarText = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 25,
      fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

  static const TextStyle headingText = TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 25,
      fontWeight: FontWeight.w900,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

  static const TextStyle descriptionText = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 20,
      fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

  static const TextStyle scrollingWidgetText = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 15,
      fontWeight: FontWeight.w100,
      fontFamily: 'Roboto-Bold',
      letterSpacing: 0.9,
      shadows: [
        Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 5)
      ]);
}

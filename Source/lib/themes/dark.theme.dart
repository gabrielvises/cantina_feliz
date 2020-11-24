import 'package:flutter/material.dart';

// TextStyle listTitleDefaultTextStyle = TextStyle(
//     color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w600);
// TextStyle listTitleSelectedTextStyle =
//     TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);

// Color selectedColor = Color(0xFF4AC8EA);

const brightness = Brightness.dark;
const primaryColor = const Color.fromRGBO(20, 20, 20, 1);
const lightColor = const Color(0xFFFFFFFF);
var cardColor = Colors.white.withOpacity(0.05);
const cinzaCor = const Color.fromRGBO(169, 174, 179, 1);
ThemeData temaDark() {
  return ThemeData(
    fontFamily: 'Roboto',
    brightness: brightness,
    primaryColor: primaryColor,
    accentColor: Colors.white,
    cardColor: cardColor,
    scaffoldBackgroundColor: Color.fromRGBO(32, 33, 37, 1),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontWeight: FontWeight.w400,
        color: lightColor,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        color: lightColor,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w400,
        color: lightColor,
      ),
      caption: TextStyle(
        fontWeight: FontWeight.w100,
        color: cinzaCor,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: lightColor,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: lightColor,
      ),
    ),
  );
}

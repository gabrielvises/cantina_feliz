import 'package:flutter/material.dart';

// TextStyle listTitleDefaultTextStyle = TextStyle(
//     color: Colors.white70, fontSize: 20.0, fontWeight: FontWeight.w600);
// TextStyle listTitleSelectedTextStyle =
//     TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600);

// Color selectedColor = Color(0xFF4AC8EA);

final corFundoCard = Color.fromRGBO(247, 247, 247, 1);
final corFundoCardEsquerda = Color.fromRGBO(239, 239, 239, 1);

const brightness = Brightness.light;
const primaryColor = const Color.fromRGBO(41, 38, 110, 1);
const lightColor = const Color(0xFFFFFFFF);
const inicioGradiente = Color.fromRGBO(41, 38, 70, 1);
const fimGradiente = Color.fromRGBO(41, 38, 110, 1);

const primaryText = const Color.fromRGBO(41, 38, 91, 1);

const secondaryText = const Color(0xFFFFFFFF);

ThemeData temaPadrao() {
  return ThemeData(
    fontFamily: 'Roboto',
    brightness: brightness,
    primaryColor: primaryColor,
    textTheme: TextTheme(
      headline1: TextStyle(fontWeight: FontWeight.w400, color: lightColor),
      headline2: TextStyle(
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
      headline6: TextStyle(fontWeight: FontWeight.w400, color: primaryText),
      subtitle1: TextStyle(fontWeight: FontWeight.w400, color: primaryText),
      caption: TextStyle(
        fontWeight: FontWeight.w100,
        color: primaryColor,
      ),
      bodyText1: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        // color: primaryText,
      ),
      bodyText2: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        // color: primaryText,
      ),
    ),
    accentColor: Colors.white,
    cardColor: Colors.white,
    scaffoldBackgroundColor: Color.fromRGBO(241, 245, 248, 1),
  );
}
// enum Temas {
//   Padrao,
//   Dark,
// }

// final appThemeData = {
//   Temas.Padrao: ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Color.fromRGBO(41, 38, 91, 1),
//   ),
//   Temas.Dark: ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.black,
//   ),
// };

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudyTheme {
  StudyTheme._();

  static final font = GoogleFonts.montserratTextTheme().copyWith(
    headline1: const TextStyle(color: nearlyBlack, fontWeight: FontWeight.bold),
    headline2: const TextStyle(color: nearlyBlack, fontWeight: FontWeight.bold),
    headline3: const TextStyle(color: nearlyBlack, fontWeight: FontWeight.bold),
    headline4: const TextStyle(color: nearlyBlack, fontWeight: FontWeight.bold),
    headline5: const TextStyle(color: nearlyBlack, fontWeight: FontWeight.bold),
    headline6: const TextStyle(color: nearlyBlack, fontWeight: FontWeight.bold),
    bodyText1: const TextStyle(color: nearlyBlack),
    bodyText2: const TextStyle(color: nearlyBlack),
    subtitle1: const TextStyle(color: nearlyBlack),
    subtitle2: const TextStyle(color: nearlyBlack),
    caption: const TextStyle(color: grey),
    button: const TextStyle(color: Colors.white, fontSize: 14)
  );

  static const teal = {
    50: Color(0xffB2DFDB),
    100: Color(0xff80CBC4),
    200: Color(0xff4DB6AC),
    300: Color(0xff26A69A),
    400: Color(0xff009688),
    500: Color(0xff00897B),
    600: Color(0xff00897B),
    700: Color(0xff00796B),
    800: Color(0xff00695C),
    900: Color(0xff004D40),
  };

  static final primary = Colors.teal[800];
  static final primaryAccent = Colors.tealAccent;
  static final primaryDark = Colors.blueGrey;
  static final darkTeal = teal[900];
  static final nearlyTeal = teal[600];
  static final nearlyLightTeal = teal[100];
  static const nearlyBlack = Color(0xFF213333);
  static const grey = Color(0xFF3A5160);
  static const darkGrey = Color(0xFF313A44);
  static const nearlyWhite = Color(0xFFFAFAFA);
  static const background = Color(0xFFf7f3f2);
  static const gradientColor2 = Color(0xff6A88E5);
  static const orangeColor = Color(0xffe3492b);
  static const orangeColorDark = Color(0xffBF360C);
  static const yellowColor = Color(0xfff8c765);
  static const gradient1 = Color(0xFF2633C5);
  static const gradient2 = Color(0xFF6F56E8);

  // Gradients
  static const linearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradient1, gradient2],
  );

  static const purpPinklinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7F00FF), Color(0xFFE100FF)],
  );

  static const scotterlinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF36D1DC), Color(0xFF5B86E5)],
  );

  static const alivelinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFCB356B), Color(0xFFBD3F32)],
  );

  static const meridianlinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF283c86), Color(0xFF45a247)],
  );

  static const chityllinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF007991), Color(0xFF78ffd6)],
  );



  static const smallCard = BorderRadius.all(
    Radius.circular(16),
  );

  static const largeCard = BorderRadius.all(
    Radius.circular(32),
  );

  static ThemeData light = ThemeData(
    primarySwatch: MaterialColor(teal[800].value, teal),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.all(16.0),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: Colors.white60,
      shape: RoundedRectangleBorder(borderRadius: smallCard),
    ),
    buttonTheme: ButtonThemeData(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        shape: RoundedRectangleBorder(borderRadius: smallCard),
        buttonColor: orangeColor),
    appBarTheme: AppBarTheme(
        color: teal[50], actionsIconTheme: IconThemeData(color: teal[600])),
    iconTheme: IconThemeData(color: teal[400]),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: orangeColor,
      focusColor: orangeColorDark,
      splashColor: orangeColor.withOpacity(0.25),
    ),
    fontFamily: 'Montserrat',
    textTheme: font,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    accentColorBrightness: Brightness.light,
  );

  static ThemeData dark = light.copyWith(
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
  );
}

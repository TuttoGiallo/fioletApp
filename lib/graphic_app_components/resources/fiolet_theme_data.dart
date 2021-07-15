import 'package:fiolet/graphic_app_components/resources/app_colors_palette.dart';
import 'package:flutter/material.dart';

class FioletThemeData {
  static ThemeData fioletThemeDataBase() {
    return ThemeData(
        fontFamily: 'Roboto',
        primaryColor: Colors.deepOrangeAccent,
        accentColor: Colors.purple,
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          headline6: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
          caption: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14.0, color: Colors.green),
          bodyText2: TextStyle(fontSize: 20, color: Colors.purple),
        ));
  }

  static ThemeData fioletThemeDataLight() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        backgroundColor: AppColorsPalette.background.clear,
        primaryColor: AppColorsPalette.main.medium,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(AppColorsPalette.main.mediumDark),
        )));
  }

  static ThemeData fioletThemeDataDark() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      textTheme: fioletTextThemeBase(),
        accentColor: AppColorsPalette.accents.lightningYellow,
        backgroundColor: AppColorsPalette.background.dark,
        primaryColor: AppColorsPalette.main.medium,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(AppColorsPalette.main.mediumClear),
        )));
  }

  static TextTheme fioletTextThemeBase(){
    return TextTheme(

      headline1: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
      headline2: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
      headline3: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
      headline4: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
      headline5: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
      headline6: TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
      caption: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14.0, color: Colors.green),
      bodyText2: TextStyle(fontSize: 18, color: Colors.yellow),
      bodyText1: TextStyle(fontSize: 22, color: Colors.orange),
      button: TextStyle(fontSize: 18, color: Colors.red ),
    );
  }
}

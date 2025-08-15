import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';

ThemeData catppuccinTheme(Flavor flavor, Brightness brightness) {
  Color primaryColor = brightness == Brightness.light ? Color(0xFF121212) : flavor.rosewater;
  Color secondaryColor = flavor.pink;
  return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: flavor.crust,
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              color: flavor.text, fontSize: 20, fontWeight: FontWeight.bold),
          backgroundColor: flavor.crust,
          foregroundColor: flavor.mantle),
      colorScheme: ColorScheme(
        //background: flavor.base,
        brightness: brightness,
        error: flavor.surface2,
        //onBackground: flavor.text,
        onError: flavor.red,
        onPrimary: primaryColor,
        onSecondary: secondaryColor,
        onSurface: flavor.text,
        primary: primaryColor,
        secondary: flavor.mantle,
        surface: flavor.surface0,
        inverseSurface: flavor.subtext1
      ),
      textTheme: const TextTheme().apply(
        bodyColor: flavor.text,
        displayColor: primaryColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
      ));
}
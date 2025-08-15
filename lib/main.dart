import 'package:catppuccin_flutter/catppuccin_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_input_validation/screens/input_validation/input_validation_screen.dart';
import 'package:flutter_input_validation/theme/catppuccin_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: catppuccinTheme(catppuccin.latte, Brightness.light),
      darkTheme: catppuccinTheme(catppuccin.mocha, Brightness.dark),
      home: Scaffold(
        body: SafeArea(child: InputValidationScreen()),
      ),
    );
  }
}

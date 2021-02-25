import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );
}

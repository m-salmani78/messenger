import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );
}

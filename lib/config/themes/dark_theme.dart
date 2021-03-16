import 'package:flutter/material.dart';

import 'theme_config.dart';

class DarkTheme implements IThemeConfig {
  static final DarkTheme _instance = DarkTheme._internal();

  DarkTheme._internal();

  factory DarkTheme() => _instance;

  @override
  ThemeData themeData = ThemeData(
    accentColor: Colors.deepPurpleAccent[100],
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  @override
  Color get scaffoldBackground => Colors.grey[850] ?? Colors.white10;

  @override
  Color get bottomAppBar => Colors.grey[900] ?? Colors.black26;

  @override
  Color get myMessage => themeData.accentColor.withOpacity(0.6);

  @override
  Color get othersMessage => Colors.black.withOpacity(0.6);
}

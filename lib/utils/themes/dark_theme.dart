import 'package:flutter/material.dart';

import 'theme_config.dart';

class DarkTheme implements IThemeConfig {
  static final DarkTheme _instance = DarkTheme._internal();

  DarkTheme._internal();

  factory DarkTheme() => _instance;

  @override
  ThemeData themeData = ThemeData(
    accentColor: kAccentColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  @override
  Color get bottomAppBar => Colors.black;

  @override
  Color get textField => Colors.grey[700];

  @override
  Color get myMessage => themeData.accentColor;

  @override
  Color get othersMessage => Colors.black;
}

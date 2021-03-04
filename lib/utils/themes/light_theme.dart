import 'package:flutter/material.dart';
import 'package:messenger/utils/themes/theme_config.dart';

class LightTheme implements IThemeConfig {
  static final LightTheme _instance = LightTheme._();

  LightTheme._();

  factory LightTheme() => _instance;

  @override
  ThemeData themeData = ThemeData(
    primarySwatch: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  @override
  Color get bottomAppBar => Colors.deepPurple[50];

  @override
  Color get textField => Colors.white;

  @override
  Color get myMessage => themeData.primaryColorLight;

  @override
  Color get othersMessage => Colors.white;
}

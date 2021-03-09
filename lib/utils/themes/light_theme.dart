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
    appBarTheme: AppBarTheme(brightness: Brightness.dark),
    brightness: Brightness.light,
  );

  @override
  Color get scaffoldBackground => Colors.deepPurple[50];

  @override
  Color get bottomAppBar => themeData.primaryColor.withOpacity(0.1);

  @override
  Color get myMessage => themeData.primaryColor.withOpacity(0.4);

  @override
  Color get othersMessage => Colors.white.withOpacity(0.4);
}

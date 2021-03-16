import 'package:flutter/material.dart';
import 'package:messenger/utils/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

abstract class IThemeConfig {
  ThemeData get themeData;

  Color get bottomAppBar;

  Color get scaffoldBackground;

  Color get myMessage;

  Color get othersMessage;
}

class ThemeConfig with ChangeNotifier {
  IThemeConfig theme;

  ThemeConfig(this.theme);

  void toggleTheme(BuildContext context) async {
    var turnIntoDark = Theme
        .of(context)
        .brightness == Brightness.light;
    theme = turnIntoDark ? DarkTheme() : LightTheme();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefsKeys.night_mode, turnIntoDark);
    notifyListeners();
  }

  static Future<IThemeConfig> initialTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool nightMode = prefs.getBool(SharedPrefsKeys.night_mode) ?? false;
    return nightMode ? DarkTheme() : LightTheme();
  }
}

OutlineInputBorder customOutlineInputBorder(Color borderColor,
    {double width = 2.0, double radius = 24}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor, width: width),
    );

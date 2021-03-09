import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

Color kPrimaryColor = Colors.deepPurple;
Color kAccentColor = Colors.deepPurpleAccent;

abstract class IThemeConfig {
  ThemeData get themeData;

  Color get bottomAppBar;

  Color get scaffoldBackground;

  Color get myMessage;

  Color get othersMessage;
}

class ThemeConfig with ChangeNotifier {
  IThemeConfig theme = LightTheme();

  void toggleTheme(BuildContext context) {
    theme = Theme.of(context).brightness == Brightness.dark
        ? LightTheme()
        : DarkTheme();
    notifyListeners();
  }
}

OutlineInputBorder customOutlineInputBorder(Color borderColor,
        {double width = 2.0, double radius = 24}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor, width: width),
    );

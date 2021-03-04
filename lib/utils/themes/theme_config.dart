import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

Color kPrimaryColor = Colors.deepPurple;
Color kAccentColor = Colors.deepPurpleAccent;

abstract class IThemeConfig {
  ThemeData get themeData;
  Color get textField;
  Color get bottomAppBar;
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

import 'package:flutter/material.dart';
import 'package:messenger/screens/home_page/home.dart';
import 'package:provider/provider.dart';

import 'config/themes/theme_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeConfig(),
      child: Consumer<ThemeConfig>(
        builder: (context, state, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.theme.themeData,
            home: HomePage(),
          );
        },
      ),
    );
  }
}

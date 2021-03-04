import 'package:flutter/material.dart';
import 'package:messenger/utils/themes/theme_config.dart';
import 'package:provider/provider.dart';

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
            theme: theme,
            home: Scaffold(),
          );
        },
      ),
    );
  }
}

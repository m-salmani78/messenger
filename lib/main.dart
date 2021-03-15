import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home_page/home.dart';
import 'config/themes/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale("fa"),
        Locale("en"),
      ],
      fallbackLocale: Locale("en"),
      path: 'assets/langs',
    ),
  );
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
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: state.theme.themeData,
            home: HomePage(),
          );
        },
      ),
    );
  }
}

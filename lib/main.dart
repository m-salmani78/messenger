import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/main_page/main_page.dart';
import 'config/themes/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  IThemeConfig theme = await ThemeConfig.initialTheme();

  runApp(
    EasyLocalization(
      child: MyApp(theme: theme),
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
  final IThemeConfig theme;

  const MyApp({required this.theme});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeConfig(theme),
      child: Consumer<ThemeConfig>(
        builder: (context, state, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: state.theme.themeData,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:messenger/screens/chat_room/chat_room.dart';
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
            debugShowCheckedModeBanner: false,
            theme: state.theme.themeData,
            home: ChatRoomScreen(),
          );
        },
      ),
    );
  }
}

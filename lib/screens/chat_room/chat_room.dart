import 'package:flutter/material.dart';
import 'package:messenger/constants/constants.dart';
import 'package:provider/provider.dart';

import 'repos/message_manager.dart';
import 'repos/offline_message_handler.dart';
import 'widgets/body.dart';
import 'widgets/text_composer.dart';

class ChatRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeConfig = Provider.of<ThemeConfig>(context);
    return ChangeNotifierProvider(
      create: (context) => MessageHandler(OfflineMessageHandler()),
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: TextStyle(color: Colors.white),
          title: Text('Mahdi'),
          actions: [
            IconButton(
              icon: Theme.of(context).brightness == Brightness.dark
                  ? Icon(Icons.brightness_high)
                  : Icon(Icons.brightness_3),
              onPressed: () => themeConfig.toggleTheme(context),
            )
          ],
        ),
        body: Column(
          children: [
            Flexible(child: Body()),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: themeConfig.theme.bottomAppBar),
              child: TextComposer(),
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
          ],
        ),
      ),
    );
  }
}
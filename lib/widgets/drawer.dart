import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:messenger/config/language/locale_keys.dart';
import 'package:messenger/config/themes/theme_config.dart';
import 'package:messenger/screens/chat_room/chat_room.dart';
import 'package:messenger/utils/helpers/color_helper.dart';
import 'package:provider/provider.dart';

class CustomDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeConfig = Provider.of<ThemeConfig>(context);
    final background = Theme.of(context).accentColor;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: background),
            otherAccountsPictures: [
              IconButton(
                icon: Theme.of(context).brightness == Brightness.dark
                    ? Icon(Icons.brightness_high)
                    : Icon(Icons.brightness_3, color: Colors.white),
                onPressed: () => themeConfig.toggleTheme(context),
              )
            ],
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(
                size: 60,
                style: FlutterLogoStyle.stacked,
              ),
              backgroundColor: Colors.white,
              radius: 30,
            ),
            accountName: Text(
              LocaleKeys.name.tr(),
              style: TextStyle(color: ColorHelper.contrastColor(background)),
            ),
            accountEmail: Text(
              '09103839063',
              style: TextStyle(color: ColorHelper.contrastColor(background)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(LocaleKeys.account_info).tr(),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(LocaleKeys.msg).tr(),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatRoomScreen();
              }));
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text(LocaleKeys.msg_pinned.tr()),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(LocaleKeys.settings.tr()),
            onTap: () {
              if (context.locale.languageCode == Locale('en').languageCode)
                context.setLocale(Locale('fa'));
              else
                context.setLocale(Locale('en'));
              Navigator.pop(context);
            },
          ),
          Divider(
            thickness: 1,
            indent: 8,
            endIndent: 8,
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text(LocaleKeys.invite_friends).tr(),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(LocaleKeys.faq).tr(),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:messenger/config/themes/theme_config.dart';
import 'package:provider/provider.dart';

class CustomDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeConfig = Provider.of<ThemeConfig>(context);
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            otherAccountsPictures: [
              IconButton(
                icon: Theme.of(context).brightness == Brightness.dark
                    ? Icon(Icons.brightness_high)
                    : Icon(Icons.brightness_3,color: Colors.white),
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
            accountName: Text('محمد مهدی سلمانی'),
            accountEmail: Text('09103839063'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('اطلاعات کاربری'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('پیام ها'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('نشان شده ها'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('تنظیمات'),
            onTap: () {
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
            title: Text('دعوت دوستان'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('پرسش های متداول'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

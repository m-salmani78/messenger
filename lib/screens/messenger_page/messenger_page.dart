import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:messenger/config/language/locale_keys.dart';
import 'package:messenger/widgets/custom_app_bar.dart';
import 'package:messenger/widgets/drawer.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          color: Theme.of(context).accentColor,
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
          tabs: [
            Tab(text: LocaleKeys.messenger.tr(gender: "chats")),
            Tab(text: LocaleKeys.messenger.tr(gender: "groups")),
            Tab(text: LocaleKeys.messenger.tr(gender: "calls")),
          ],
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
        drawer: CustomDrawerView(),
      ),
    );
  }
}

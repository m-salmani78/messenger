import 'package:flutter/material.dart';
import 'package:messenger/widgets/custom_text_field.dart';
import 'package:messenger/widgets/drawer.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: CustomTextField(hintText: "Search...",),
          ),
          actions: [
            IconButton(icon: Icon(Icons.add), onPressed: (){})
          ],
          bottom: TabBar(
            labelColor: Theme.of(context).accentColor,
            tabs: [
              Tab(text: "Chats",),
              Tab(text: "Groups",),
              Tab(text: "Calls"),
            ],
          ),
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

import 'package:flutter/material.dart';
import 'package:messenger/screens/home_page/widgets/drawer.dart';
import 'package:messenger/screens/home_page/widgets/expandable_fab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('title'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
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
        floatingActionButton: ExpandableFab(distance: 84, children: [
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.person_add),
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.group_add),
          ),
          ActionButton(
            onPressed: () => {},
            icon: const Icon(Icons.add_call),
          ),
        ]),
      ),
    );
  }
}

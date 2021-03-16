import 'package:flutter/material.dart';
import 'package:messenger/widgets/custom_app_bar.dart';
import 'package:messenger/widgets/drawer.dart';

class WhatsHotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: Theme.of(context).accentColor,
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {},
          )
        ],
      ),
      drawer: CustomDrawerView(),
    );
  }
}

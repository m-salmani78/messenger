import 'package:flutter/material.dart';
import 'package:messenger/widgets/drawer.dart';
import 'package:messenger/widgets/shimmer.dart';

import 'widgets/body.dart';

const _shimmerGradient = LinearGradient(
  colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).accentColor),
        title: Text('Home',
            style: TextStyle(color: Theme.of(context).accentColor)),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Shimmer(
        linearGradient: _shimmerGradient,
        child: Body(_isLoading),
      ),
      drawer: CustomDrawerView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLoading,
        child: Icon(
          _isLoading ? Icons.hourglass_full : Icons.hourglass_bottom,
        ),
      ),
    );
  }

  void _toggleLoading() {
    setState(() => _isLoading = !_isLoading);
  }
}

import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.yellow[700],
        ),
        drawer: NavBar(),
        body: Text('list page'),
      ),
    );
  }
}

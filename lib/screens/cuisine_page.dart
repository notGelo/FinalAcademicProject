import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
import 'package:grubhie/utilities/constants.dart';

class CuisinePage extends StatefulWidget {
  @override
  _CuisinePageState createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.yellow[700],
        ),
        drawer: NavBar(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50.0),
              child: Text(
                'CUISINES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue[500],
                  fontSize: 50.0,
                ),
              ),
            ),
            kcustomWidget(
              inputText: 'JAPANESE',
              col: Colors.red,
              height: 100,
            ),
            kcustomWidget(
              inputText: 'ITALIAN',
              col: Colors.red,
              height: 100,
            ),
            kcustomWidget(
              inputText: 'CHINESE',
              col: Colors.red,
              height: 100,
            ),
            kcustomWidget(
              inputText: 'ENGLISH',
              col: Colors.red,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';

class CuisinePage extends StatefulWidget {
  const CuisinePage({Key? key}) : super(key: key);

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
            Text(
              'CUISINES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue[500],
                fontSize: 50.0,
              ),
            ),
            Container(
              child: Card(
                child: Text(
                  'Japanese',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

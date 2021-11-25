import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: kscaffoldKey,
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.hamburger),
            color: Colors.pink,
            onPressed: () {
              kscaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: NavBar(),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50.0),
              child: Text(
                'Daily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                kcustomWidget(
                  inputText: 'HENLO',
                  col: Colors.red,
                  height: 200,
                ),
                kcustomWidget(
                  inputText: 'HI',
                  col: Colors.grey,
                  height: 200,
                ),
                kcustomWidget(
                  inputText: 'OMG??',
                  col: Colors.red,
                  height: 200,
                ),
                kcustomWidget(
                  inputText: 'CUSTOM',
                  col: Colors.red,
                  height: 200,
                ),
                kcustomWidget(
                  inputText: 'WIDGET',
                  col: Colors.red,
                  height: 200,
                ),
                kcustomWidget(
                  inputText: 'IS ROCKZZ',
                  col: Colors.red,
                  height: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//REUSABLE WIDGETS
Expanded kcustomWidget(
    {String inputText = '',
    Color col = Colors.teal,
    double width = 0,
    double height = 0,
    double inputMargin = 0.0}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(inputMargin),
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(inputText),
        color: col,
      ),
    ),
  );
}

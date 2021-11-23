import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.yellow[700],
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
                customWidget(
                  inputText: 'HENLO',
                  col: Colors.red,
                ),
                customWidget(
                  inputText: 'HI',
                  col: Colors.grey,
                ),
                customWidget(
                  inputText: 'OMG??',
                  col: Colors.red,
                ),
                customWidget(
                  inputText: 'CUSTOM',
                  col: Colors.red,
                ),
                customWidget(
                  inputText: 'WIDGET',
                  col: Colors.red,
                ),
                customWidget(
                  inputText: 'IS ROCKZZ',
                  col: Colors.red,
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

Expanded customWidget({String inputText = '', Color col = Colors.teal}) {
  return Expanded(
    child: Container(
      height: 200,
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

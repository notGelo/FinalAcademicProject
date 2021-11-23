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
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              'Daily',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customWidget(
                      inputText: 'HELLO',
                      col: Colors.red,
                    ),
                    customWidget(
                      inputText: 'HI',
                      col: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    customWidget(
                      inputText: 'OMG??',
                      col: Colors.red,
                    ),
                    customWidget(
                      inputText: 'CUSTOM',
                      col: Colors.red,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
          ],
        ),
      ),
    );
  }
}

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

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
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_plain.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(widthOfScreen(context, 0.2)),
                child: Text(
                  'Daily Meal, Bitch',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widthOfScreen(context, 0.1),
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
                      col: randomColor(),
                      inputMargin: widthOfScreen(context, 0.03)),
                  kcustomWidget(
                      inputText: 'HI',
                      col: randomColor(),
                      inputMargin: widthOfScreen(context, 0.03)),
                  kcustomWidget(
                      inputText: 'OMG??',
                      col: randomColor(),
                      inputMargin: widthOfScreen(context, 0.03)),
                  kcustomWidget(
                      inputText: 'CUSTOM',
                      col: randomColor(),
                      inputMargin: widthOfScreen(context, 0.03)),
                  kcustomWidget(
                      inputText: 'WIDGET',
                      col: randomColor(),
                      inputMargin: widthOfScreen(context, 0.03)),
                  kcustomWidget(
                      inputText: 'IS ROCKZZ',
                      col: randomColor(),
                      inputMargin: widthOfScreen(context, 0.03)),
                ],
              ),
            ],
          ),
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
    double height = 100,
    double inputMargin = 10.00}) {
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

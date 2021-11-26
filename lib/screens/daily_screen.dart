import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
import 'package:grubhie/utilities/constants.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  double marginTop = 0.01;
  double marginSides = 0.05;
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // key: kscaffoldKey,
        // appBar: new AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     icon: Icon(FontAwesomeIcons.hamburger),
        //     color: Colors.pink,
        //     onPressed: () {
        //       kscaffoldKey.currentState?.openDrawer();
        //     },
        //   ),
        // ),
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
                height: min(
                    widthOfScreen(context, 0.4), heightOfScreen(context, 0.4)),
                child: Image(
                  image: AssetImage('assets/images/grubhie_logo.gif'),
                ),
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/recipes');
                    },
                    child: kcustomWidget(
                        inputText: 'RECIPE',
                        col: 'ea9052'.toColor(),
                        inputMarginSides: widthOfScreen(context, marginSides),
                        inputMarginTop: widthOfScreen(context, marginTop),
                        height: widthOfScreen(context, 0.3)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/recipes');
                    },
                    child: kcustomWidget(
                        inputText: 'FUNCTION 2',
                        col: '77b255'.toColor(),
                        inputMarginSides: widthOfScreen(context, marginSides),
                        inputMarginTop: widthOfScreen(context, marginTop),
                        height: widthOfScreen(context, 0.3)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/recipes');
                    },
                    child: kcustomWidget(
                        inputText: 'FUNCTION 3',
                        col: 'e84060'.toColor(),
                        inputMarginSides: widthOfScreen(context, marginSides),
                        inputMarginTop: widthOfScreen(context, marginTop),
                        height: widthOfScreen(context, 0.3)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/recipes');
                    },
                    child: kcustomWidget(
                        inputText: 'FUNCTION 4',
                        col: '6840e8'.toColor(),
                        inputMarginSides: widthOfScreen(context, marginSides),
                        inputMarginTop: widthOfScreen(context, marginTop),
                        height: widthOfScreen(context, 0.3)),
                  ),
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
    double inputMarginTop = 0,
    double inputMarginSides = 0,
    Alignment alignText = Alignment.center}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.symmetric(
          horizontal: inputMarginSides, vertical: inputMarginTop),
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(inputText),
        color: col,
      ),
    ),
  );
}

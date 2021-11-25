import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:grubhie/customWidgets/change_theme_button_widget.dart';

class CuisinePage extends StatefulWidget {
  @override
  _CuisinePageState createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> {
  double cuisineMargin = 10;
  double cuisineHeight = 0.3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: kscaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.hamburger),
            color: Colors.pink,
            onPressed: () {
              kscaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            ChangeThemeButtonWidget(),
          ],
        ),
        drawer: NavBar(),
        body: ListView(
          padding: EdgeInsets.all(10.0),
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
            cuisineWidget(
              inputText: 'JAVANESE',
              col: Colors.red,
              height: min(getScreenHeight(context) * cuisineHeight,
                  getScreenWidth(context) * cuisineHeight),
              inputMargin: cuisineMargin,
            ),
            cuisineWidget(
              inputText: 'ITALIAN',
              col: Colors.red,
              height: min(getScreenHeight(context) * cuisineHeight,
                  getScreenWidth(context) * cuisineHeight),
              inputMargin: cuisineMargin,
            ),
            cuisineWidget(
              inputText: 'CHINESE',
              col: Colors.red,
              height: min(getScreenHeight(context) * cuisineHeight,
                  getScreenWidth(context) * cuisineHeight),
              inputMargin: cuisineMargin,
            ),
            cuisineWidget(
              inputText: 'ENGLISH',
              col: Colors.red,
              height: min(getScreenHeight(context) * cuisineHeight,
                  getScreenWidth(context) * cuisineHeight),
              inputMargin: cuisineMargin,
            ),
          ],
        ),
      ),
    );
  }
}

//REUSABLE WIDGETS
Expanded cuisineWidget(
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

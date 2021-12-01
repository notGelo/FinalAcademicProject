import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:grubhie/utilities/theme_model.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

double marginTop = 0.01;
double marginSides = 0.05;

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              alignment: Alignment(1, 0),
              child: IconButton(
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
                icon: Icon(
                  themeNotifier.isDark
                      ? Icons.wb_sunny
                      : Icons.nightlight_round,
                  color: themeNotifier.isDark ? Colors.yellow : Colors.black,
                ),
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(themeNotifier.isDark
                    ? 'assets/images/bg_plain_dm.png'
                    : 'assets/images/bg_plain.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  height: min(widthOfScreen(context, 0.4),
                      heightOfScreen(context, 0.4)),
                  margin: new EdgeInsets.symmetric(
                      vertical: widthOfScreen(context, 0.05)),
                  child: Image(
                    image: AssetImage(themeNotifier.isDark
                        ? 'assets/images/grubhie_logo_dm.gif'
                        : 'assets/images/grubhie_logo.gif'),
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
                          inputText: 'Search Recipes',
                          col: 'ea9052'.toColor(),
                          inputMarginSides: widthOfScreen(context, marginSides),
                          inputMarginTop: widthOfScreen(context, marginTop),
                          height: widthOfScreen(context, 0.3),
                          picSide: 'right',
                          iconImage: 'assets/images/food_1.png',
                          radius: 30.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                      child: kcustomWidget(
                          inputText: 'My Favorites',
                          col: 'e84060'.toColor(),
                          inputMarginSides: widthOfScreen(context, marginSides),
                          inputMarginTop: widthOfScreen(context, marginTop),
                          height: widthOfScreen(context, 0.3),
                          picSide: 'left',
                          iconImage: 'assets/images/food_2.png',
                          radius: 30.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/shoplist');
                      },
                      child: kcustomWidget(
                          inputText: 'Shopping List',
                          col: '77b255'.toColor(),
                          inputMarginSides: widthOfScreen(context, marginSides),
                          inputMarginTop: widthOfScreen(context, marginTop),
                          height: widthOfScreen(context, 0.3),
                          picSide: 'right',
                          iconImage: 'assets/images/food_3.png',
                          radius: 30.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/random');
                      },
                      child: kcustomWidget(
                          inputText: 'What to cook?',
                          col: '6840e8'.toColor(),
                          inputMarginSides: widthOfScreen(context, marginSides),
                          inputMarginTop: widthOfScreen(context, marginTop),
                          height: widthOfScreen(context, 0.3),
                          picSide: 'left',
                          iconImage: 'assets/images/food_4.png',
                          radius: 30.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

//REUSABLE WIDGETS
Container kcustomWidget(
    {String inputText = '',
    Color col = Colors.teal,
    double width = 0,
    double height = 100,
    double inputMarginTop = 0,
    double inputMarginSides = 0,
    Alignment alignText = Alignment.center,
    String picSide = '',
    String iconImage = '',
    double radius = 0}) {
  if (picSide == 'right') {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: inputMarginSides, vertical: inputMarginTop),
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius * 1.5),
            topRight: Radius.circular(radius / 2),
            bottomLeft: Radius.circular(radius * 1.5),
            bottomRight: Radius.circular(radius / 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: radius),
              child: Text(
                inputText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height / 4,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
            Image(
              image: AssetImage(iconImage),
            ),
          ],
        ),
        color: col,
      ),
    );
  } else {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: inputMarginSides, vertical: inputMarginTop),
      height: height,
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius / 2),
            topRight: Radius.circular(radius * 1.5),
            bottomLeft: Radius.circular(radius / 2),
            bottomRight: Radius.circular(radius * 1.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(iconImage),
            ),
            Container(
              margin: EdgeInsets.only(right: radius),
              child: Text(
                inputText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height / 4,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        color: col,
      ),
    );
  }
}

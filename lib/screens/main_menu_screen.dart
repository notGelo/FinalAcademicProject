import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
import 'package:grubhie/utilities/constants.dart';
import 'dart:math';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
                margin: new EdgeInsets.symmetric(
                    vertical: widthOfScreen(context, 0.05)),
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
                      Navigator.pushNamed(context, '/recipes');
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

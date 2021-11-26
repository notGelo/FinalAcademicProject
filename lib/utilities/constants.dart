import 'package:flutter/material.dart';
import 'dart:math';

//SCAFFOLD KEY
var kscaffoldKey = GlobalKey<ScaffoldState>();

//GET SCREEN HEIGHT AND WIDTH
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double widthOfScreen(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double heightOfScreen(BuildContext context, double height) {
  return MediaQuery.of(context).size.height * height;
}

//random color generator
Color randomColor() {
  Random random = new Random();
  return Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}

//hexColorShemene

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

//DECORATIONS
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Color.fromRGBO(230, 230, 230, 1),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
    borderSide: BorderSide.none,
  ),
);

//CUSTOM WIDGETS

//THEME 1

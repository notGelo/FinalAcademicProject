import 'package:flutter/material.dart';

//GET SCREEN HEIGHT AND WIDTH WITHOUT SAFE AREA
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//DECORATIONS
const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter Ingredients, Cuisines or something',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

//CUSTOM WIDGETS
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
//THEME 1

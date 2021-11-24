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

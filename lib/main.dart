import 'package:flutter/material.dart';
import 'package:grubhie/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: HomeScreen(),
    );
  }
}

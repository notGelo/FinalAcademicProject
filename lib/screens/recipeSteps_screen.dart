import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';

class RecipeStepsPage extends StatefulWidget {
  @override
  _RecipeStepsPageState createState() => _RecipeStepsPageState();
}

class _RecipeStepsPageState extends State<RecipeStepsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.yellow[700],
        ),
        drawer: NavBar(),
        body: Text('recipe steps page'),
      ),
    );
  }
}

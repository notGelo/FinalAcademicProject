import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';

class FilteredRecipePage extends StatefulWidget {
  @override
  _FilteredRecipePageState createState() => _FilteredRecipePageState();
}

class _FilteredRecipePageState extends State<FilteredRecipePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.yellow[700],
        ),
        drawer: NavBar(),
        body: Text('filtered recipe page'),
      ),
    );
  }
}

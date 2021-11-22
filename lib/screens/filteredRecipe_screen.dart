import 'package:flutter/material.dart';

class FilteredRecipePage extends StatefulWidget {
  const FilteredRecipePage({Key? key}) : super(key: key);

  @override
  _FilteredRecipePageState createState() => _FilteredRecipePageState();
}

class _FilteredRecipePageState extends State<FilteredRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('filtered recipe page'));
  }
}

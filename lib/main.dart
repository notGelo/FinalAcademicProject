import 'package:flutter/material.dart';
import 'package:grubhie/screens/home_screen.dart';
import 'package:grubhie/screens/cuisine_page.dart';
import 'package:grubhie/screens/ingredients_screen.dart';
import 'package:grubhie/screens/category_screen.dart';
import 'package:grubhie/screens/list_screen.dart';
import 'package:grubhie/screens/recipe_screen.dart';
import 'package:grubhie/screens/recipeSteps_screen.dart';
import 'package:grubhie/screens/filteredRecipe_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white70,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/cuisine': (context) => CuisinePage(),
        '/ingredients': (context) => IngredientsPage(),
        '/category': (context) => CategoryPage(),
        '/list': (context) => ListPage(),
        '/recipe': (context) => RecipePage(),
        '/recipeSteps': (context) => RecipeStepsPage(),
        '/filteredRecipe': (context) => FilteredRecipePage(),
      },
    );
  }
}

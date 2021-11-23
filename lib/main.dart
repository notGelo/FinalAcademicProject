import 'package:flutter/material.dart';
import 'package:grubhie/screens/home_screen.dart';
import 'package:grubhie/screens/cuisine_page.dart';
import 'package:grubhie/screens/ingredients_screen.dart';
import 'package:grubhie/screens/category_screen.dart';
import 'package:grubhie/screens/list_screen.dart';
import 'package:grubhie/screens/recipe_screen.dart';
import 'package:grubhie/screens/recipeSteps_screen.dart';
import 'package:grubhie/screens/filteredRecipe_screen.dart';
import 'package:grubhie/screens/daily_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //scaffoldBackgroundColor: Color.fromRGBO(215, 215, 215, 1),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/daily': (context) => DailyPage(),
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

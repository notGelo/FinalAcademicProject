import 'package:flutter/material.dart';
import 'package:grubhie/models.dart';
import 'package:grubhie/screens/home_screen.dart';
import 'package:grubhie/screens/cuisine_page.dart';
import 'package:grubhie/screens/ingredients_screen.dart';
import 'package:grubhie/screens/category_screen.dart';
import 'package:grubhie/screens/list_screen.dart';
import 'package:grubhie/screens/recipe_screen.dart';
import 'package:grubhie/screens/recipeSteps_screen.dart';
import 'package:grubhie/screens/filteredRecipe_screen.dart';
import 'package:grubhie/screens/daily_screen.dart';
import 'package:grubhie/screens/recipe_api.dart';
import 'package:grubhie/screens/favorites_screen.dart';
import 'package:grubhie/screens/random_screen.dart';
import 'package:provider/provider.dart';
import 'package:grubhie/provider/theme_provider.dart';
import 'package:grubhie/screens/shopping_list.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var favorites = {};
  // final LocalStorage storage = new LocalStorage('grubhie');

  void addFavorite(Model recipe) {
    setState(() {
      favorites[recipe.url] = (recipe);
      // storeFavorites();
    });
  }

  void removeFavorite(String url) {
    setState(() {
      favorites.remove(url);
      // storeFavorites();
    });
  }

  // output: List<Model>
  List listFavorites() {
    return favorites.values.toList();
  }

  // void storeFavorites() {
  //   storage.setItem('favorites', json.encode(listJsonFavorites()));
  // }

  // void parseFavorites(String listString) {
  //   List result = json.decode(listString);
  //   result.forEach((element) {
  //     addFavorite(Model.parse(element));
  //   });
  // }

  // List listJsonFavorites() {
  //   var list = [];
  //   favorites.forEach((key, value) {
  //     print(value);
  //     print(value.toList());
  //     list.add(value.toList());
  //   });
  //   return list;
  // }

  // @override
  // initState() {
  //   super.initState();

  //   // get favorites from storage
  //   var result = storage.getItem('favorites');
  //   if (result != null) {
  //     parseFavorites(result);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var state = {
      'favorites': favorites,
      'addFavorite': addFavorite,
      'removeFavorite': removeFavorite,
      'listFavorites': listFavorites,
    };
    print(listFavorites());
    print(listFavorites().length);
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          // theme: ThemeData(
          //   //scaffoldBackgroundColor: Color.fromRGBO(215, 215, 215, 1),
          //   scaffoldBackgroundColor: Colors.white,
          // ),
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
            '/recipes': (context) => Recipes(state: state),
            '/favorites': (context) => Favorites(state: state),
            '/random': (context) => RandomRecipe(),
            '/shoplist': (context) => ShoppingList(),
          },
        );
      },
    );
  }
}

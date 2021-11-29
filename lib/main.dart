import 'package:flutter/material.dart';
import 'package:grubhie/screens/home_screen.dart';
import 'package:grubhie/screens/main_menu_screen.dart';
import 'package:grubhie/screens/recipe_api.dart';
import 'package:grubhie/screens/random_screen.dart';
import 'package:provider/provider.dart';
import 'package:grubhie/provider/theme_provider.dart';
import 'package:grubhie/screens/shopping_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
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
              '/main': (context) => MainMenu(),
              '/recipes': (context) => Recipes(),
              '/random': (context) => RandomRecipe(),
              '/shoplist': (context) => ShoppingList(),
            },
          );
        },
      );
}

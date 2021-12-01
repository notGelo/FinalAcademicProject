import 'package:flutter/material.dart';
import 'package:grubhie/screens/favorites_screen.dart';
import 'package:grubhie/screens/home_screen.dart';
import 'package:grubhie/screens/main_menu_screen.dart';
import 'package:grubhie/screens/recipe_api.dart';
import 'package:grubhie/screens/random_screen.dart';
import 'package:provider/provider.dart';
import 'package:grubhie/utilities/theme_model.dart';
import 'package:grubhie/screens/shopping_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: ((false | true) && (false)) | false,
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
            home: HomeScreen(),
            routes: {
              '/home': (context) => HomeScreen(),
              '/main': (context) => MainMenu(),
              '/recipes': (context) => Recipes(),
              '/favorites': (context) => FavoritesScreen(),
              '/random': (context) => RandomRecipe(),
              '/shoplist': (context) => ShoppingList(),
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Recipes for many'),
            accountEmail: Text(''),
            currentAccountPicture: Image(
              image: AssetImage(''), //add Ghubhie logo
            ),
            decoration: BoxDecoration(
                color: Colors.blue, //change color to our color themes
                image: DecorationImage(
                  image: AssetImage(''), //add background image on burger menu
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Daily'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.set_meal),
            title: Text('Cuisines'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.food_bank),
            title: Text('Ingredients'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.format_list_bulleted),
            title: Text('What to Buy/Grocery List'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}

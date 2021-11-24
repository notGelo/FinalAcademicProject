import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            accountName: Text('GRUBHIE'),
            accountEmail: Text('Recipes for many'),
            currentAccountPicture: Image(
              image: AssetImage(''), //add Ghubhie logo
            ),
            decoration: BoxDecoration(
              color: Colors.blue, //change color to our color themes
              image: DecorationImage(
                image: AssetImage(''), //add background image on burger menu
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
              leading: Icon(FontAwesomeIcons.candyCane),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              }),
          ListTile(
              leading: Icon(FontAwesomeIcons.apple),
              title: Text('Daily'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/daily');
              }),
          ListTile(
              leading: Icon(FontAwesomeIcons.iceCream),
              title: Text('Cuisinism'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cuisine');
              }),
          ListTile(
              leading: Icon(FontAwesomeIcons.pizzaSlice),
              title: Text('Category'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/category');
              }),
          ListTile(
              leading: Icon(FontAwesomeIcons.pepperHot),
              title: Text('Ingredients'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ingredients');
              }),
          ListTile(
              leading: Icon(FontAwesomeIcons.hotdog),
              title: Text('What to Buy/Grocery List'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/list');
              }),
        ],
      ),
    );
  }
}

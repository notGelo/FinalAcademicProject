import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
import 'package:grubhie/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: kscaffoldKey,
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.hamburger),
            color: Colors.pink,
            onPressed: () {
              kscaffoldKey.currentState?.openDrawer();
            },
          ),
        ),
        drawer: NavBar(),
        body: Text('category page'),
      ),
    );
  }
}

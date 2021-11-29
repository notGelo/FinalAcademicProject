import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_home_final.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                    child: Image(
                      image: AssetImage('assets/images/grubhie_logo.gif'),
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   flex: 6,
              //   child: Container(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//REUSABLE WIDGETS

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: new Drawer(
          child: ListView(),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Text(
              'Grubhie',
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
            Container(
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text("He'd have you all unravel at the"),
                        color: Colors.teal[100],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text("He'd have you all unravel at the"),
                        color: Colors.teal[100],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text("He'd have you all unravel at the"),
                        color: Colors.teal[100],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text("He'd have you all unravel at the"),
                        color: Colors.teal[100],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text("He'd have you all unravel at the"),
                        color: Colors.teal[100],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Text("He'd have you all unravel at the"),
                        color: Colors.teal[100],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

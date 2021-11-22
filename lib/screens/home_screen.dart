import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/utilities/navBar.dart';
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
        appBar: new AppBar(
          backgroundColor: Colors.yellow[700],
        ),
        drawer: NavBar(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              'Grubhie',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldInputDecoration,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        ),
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

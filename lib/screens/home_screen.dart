import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grubhie/utilities/theme_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(themeNotifier.isDark
                    ? 'assets/images/bg_home_final_dm.png'
                    : 'assets/images/bg_home_final.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment(1.0, 1.0),
                  child: IconButton(
                    onPressed: () {
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    },
                    icon: Icon(
                      themeNotifier.isDark
                          ? Icons.wb_sunny
                          : Icons.nightlight_round,
                      color:
                          themeNotifier.isDark ? Colors.yellow : Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');
                      },
                      child: Image(
                        image: AssetImage(themeNotifier.isDark
                            ? 'assets/images/grubhie_logo_dm.gif'
                            : 'assets/images/grubhie_logo.gif'),
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
    });
  }
}

//REUSABLE WIDGETS

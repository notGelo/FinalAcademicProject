import 'package:flutter/material.dart';
import 'package:grubhie/utilities/theme_model.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(themeNotifier.isDark
                ? 'assets/images/bg_plain_dm.png'
                : 'assets/images/bg_plain.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image(
            image: AssetImage(themeNotifier.isDark
                ? 'assets/images/loading_dm.gif'
                : 'assets/images/loading.gif'),
          ),
        ),
      );
    });
  }
}

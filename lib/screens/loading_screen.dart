import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_plain.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Image(
          image: AssetImage('assets/images/loading.gif'),
        ),
      ),
    );
  }
}

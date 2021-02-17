import 'package:flutter/material.dart';

class BottomNavigationPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Esse tipo de menu fica muito bonito sem uma AppBar!',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20.0
        ),
      ),
    );
  }
}

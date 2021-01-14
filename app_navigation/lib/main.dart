import 'package:flutter/material.dart';
import 'package:flutter_navigation_samples/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Samples',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
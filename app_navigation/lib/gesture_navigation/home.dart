import 'package:flutter/material.dart';
import 'package:flutter_navigation_samples/gesture_navigation/tabs/tab_1.dart';
import 'package:flutter_navigation_samples/gesture_navigation/tabs/tab_2.dart';
import 'package:flutter_navigation_samples/gesture_navigation/tabs/tab_3.dart';

class GestureNavigationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView( // Com esse Widget, englobamos todas as "páginas"
      children: [
        Tab1(),
        Tab2(),
        Tab3(),
      ],
    );
  }
}

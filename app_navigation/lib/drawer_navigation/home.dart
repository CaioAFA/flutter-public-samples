import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_samples/drawer_navigation/tabs/tab_1.dart';
import 'package:flutter_navigation_samples/drawer_navigation/tabs/tab_2.dart';
import 'package:flutter_navigation_samples/drawer_navigation/tabs/tab_3.dart';

class DrawerNavigationHome extends StatelessWidget {

  // We can change the page by using this Controller
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(), // This doesn't let the user change the tab by sliding his finger
      controller: _pageController,
      children: [ // Pages
        Tab1(_pageController), // Index 0 Page
        Tab2(_pageController), // Index 1 Page
        Tab3(_pageController), // Index 2 Page
      ],
    );
  }
}

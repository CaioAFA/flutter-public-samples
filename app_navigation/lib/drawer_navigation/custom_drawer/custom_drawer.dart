import 'package:flutter/material.dart';
import 'package:flutter_navigation_samples/drawer_navigation/custom_drawer/drawer_tile.dart';

import 'exit_drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController _pageController;

  CustomDrawer(this._pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 203, 236, 241),
                Colors.white
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
    );

    return Drawer(
      child: Stack(
          children: [
            // Draw the Gradient Background
            _buildDrawerBack(),
            ListView(
              padding: EdgeInsets.only(left: 32.0, top: 16.0),
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                  height: 170,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text(
                          'Drawer\nNavigation',
                          style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                DrawerTile(Icons.list,            'Tab 1', 0, _pageController), // Parameters: Page Controller, Page Index and Page Title
                DrawerTile(Icons.check_box,       'Tab 2', 1, _pageController),
                DrawerTile(Icons.ac_unit_rounded, 'Tab 3', 2, _pageController),
                ExitDrawerTile()
              ],
            )
          ]
      ),
    );
  }
}
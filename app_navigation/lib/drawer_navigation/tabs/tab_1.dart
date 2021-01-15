import 'package:flutter/material.dart';
import 'package:flutter_navigation_samples/drawer_navigation/custom_drawer/custom_drawer.dart';

class Tab1 extends StatelessWidget {

  final PageController _pageController;

  Tab1(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Navigation - Página 1'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Esse talvez seja o menu mais padrão...',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: CustomDrawer(_pageController),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_samples/home_screen.dart';

import 'global_state/stores/cart_store.dart';

void main() {
  // Start GetIt - Required Plugin to Global State Sample. It's important to put this
  // IN YOUR APP MAIN FILE!
  setupLocators();

  runApp(MyApp());
}

void setupLocators(){
  // Create the Store:  It'll be accessible to any Widget.
  GetIt.I.registerSingleton(CartStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Samples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

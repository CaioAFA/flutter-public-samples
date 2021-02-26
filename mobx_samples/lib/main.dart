import 'package:flutter/material.dart';
import 'package:mobx_samples/home_screen.dart';
import 'package:provider/provider.dart';

import 'global_state/stores/cart_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // With Provider, we can have a Global State. It's important to put this
    // IN YOUR APP MAIN FILE! This is needed to global state sample.

    return Provider<CartStore>(
        create: (_) => CartStore(), // Create the Store: It'll be accessible to any Widget inside the tree
        child: MaterialApp(
          title: 'MobX Samples',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        )
    );
  }
}

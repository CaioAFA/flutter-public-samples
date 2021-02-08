import 'package:flutter/material.dart';

class CustomScrollViewSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false, // Show 100% of the Sliver App Bar only when the screen is at the top
      pinned: true, // Dont disappear completely when scroll down
      expandedHeight: 200.0,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Custom Scroll View',
          style: TextStyle(
            fontWeight: FontWeight.w900
          ),
        ),
        centerTitle: true,
        background: Center(
          child: FlutterLogo(
            size: 90,
          )
        ),
      ),
    );
  }
}

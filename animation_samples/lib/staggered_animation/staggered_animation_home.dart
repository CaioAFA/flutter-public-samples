import 'package:flutter/material.dart';

class TwoOrMoreAnimationsTogetherHome extends StatefulWidget {
  @override
  _TwoOrMoreAnimationsTogetherHomeState createState() => _TwoOrMoreAnimationsTogetherHomeState();
}

class _TwoOrMoreAnimationsTogetherHomeState extends State<TwoOrMoreAnimationsTogetherHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> containerWidth;
  
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    // O Container começará com 400 de largura e terminará com 200.
    containerWidth = Tween<double>(begin: 400.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: null, builder: null);
  }
}

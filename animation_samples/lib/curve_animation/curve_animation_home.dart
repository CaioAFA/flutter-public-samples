import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurveAnimationHome extends StatefulWidget {
  @override
  _CurveAnimationHome createState() => _CurveAnimationHome();
}

class _CurveAnimationHome extends State<CurveAnimationHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> containerSpin;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );

    containerSpin = Tween<double>( // O container algumas voltas
      begin: 0,
      end: 1065
    ).animate(
      CurvedAnimation( // Aqui passamos a curva. Experimente outras!
        curve: Curves.easeInCubic,
        parent: _controller
      )
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curve Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: containerSpin,
          builder: (context, child){
            return RotationTransition(
              turns: AlwaysStoppedAnimation(containerSpin.value / 360),
              child: Container(
                color: Colors.black,
                width: 300,
                height: 300,
                alignment: Alignment.center,
                child: Text(
                  'Curve Animation!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:animation_samples/screen_transition/animated_container_transition.dart';
import 'package:flutter/material.dart';

class ScreenTransition2 extends StatefulWidget {
  @override
  _ScreenTransition2State createState() => _ScreenTransition2State();
}

class _ScreenTransition2State extends State<ScreenTransition2> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> containerSize;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    // Cria uma animação que varia de 1 à 0.
    containerSize = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic
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
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child){
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text('Screen Transition Home'),
                  centerTitle: true,
                  backgroundColor: Colors.black,
                ),
                body: Center(
                  child: Text(
                    'Estamos em outra tela!',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: AnimatedContainerTransition(
                  containerSize: containerSize,
                ),
              )
            ],
          );
        }
    );
  }
}

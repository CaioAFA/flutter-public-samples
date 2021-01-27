import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PingPongAnimationHome extends StatefulWidget {
  @override
  _PingPongAnimationHome createState() => _PingPongAnimationHome();
}

class _PingPongAnimationHome extends State<PingPongAnimationHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> containerGrow;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );

    containerGrow = Tween<double>(
      begin: 0,
      end: 300
    ).animate(_controller);

    // Temos dois tipos de listeners: quando a animação muda de valor (addListener)
    // e quando muda de estado (começo ou fim: addStatusListener).
    containerGrow.addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controller.reverse(); // Quando termina a animação, faz com que ela retorne ao início
      }
      else if(status == AnimationStatus.dismissed){ // Animação chegou ao 0
        _controller.forward(); // Faz com que a animação rode novamente para frente.
      }
    });

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
        title: Text('Ping Pong Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: containerGrow,
          builder: (context, child){
            return Container(
              color: Colors.greenAccent,
              width: containerGrow.value,
              height: containerGrow.value,
              alignment: Alignment.center,
              child: Text(
                'Ping Pong!',
                style: TextStyle(
                  fontSize: containerGrow.value * 0.25,
                  fontWeight: FontWeight.w500,
                  color: Colors.red
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}

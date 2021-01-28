import 'package:flutter/material.dart';

class LoadingButtonAnimationHome extends StatefulWidget {
  @override
  _LoadingButtonAnimationHomeState createState() => _LoadingButtonAnimationHomeState();
}

class _LoadingButtonAnimationHomeState extends State<LoadingButtonAnimationHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> buttonWidthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1300));

    // O botão começará com X de largura e terminará com Y.
    buttonWidthAnimation = Tween<double>(begin: 200.0, end: 70.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linearToEaseOut,
        reverseCurve: Curves.fastLinearToSlowEaseIn
      )
    );

    // Quando o botão terminar a animação, volta ele ao estado inicial
    _controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Future.delayed(Duration(milliseconds: 300)).then((_){
          _controller.reverse();
        });
      }
    });
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
        title: Text('Loading Button Animation'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
          animation: buttonWidthAnimation,
          builder: (context, child){
            return Center(
              child: GestureDetector(
                onTap: (){
                  _controller.forward();
                },
                child: Container(
                  width: buttonWidthAnimation.value,
                  height: 70.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    color: Colors.deepOrangeAccent,
                  ),

                  // Renderizamos o texto ou o indicador de progresso de acordo
                  // com o estado da animação!
                  child: buttonWidthAnimation.value < 130 ?
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ) :
                    Text(
                      'Click!',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),
                    ),
                ),
              ),
            );
          }
      ),
    );
  }
}

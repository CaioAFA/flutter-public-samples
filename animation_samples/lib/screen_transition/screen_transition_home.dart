import 'package:animation_samples/screen_transition/animated_container_transition.dart';
import 'package:animation_samples/screen_transition/screen_transition_2.dart';
import 'package:flutter/material.dart';

// Essa animação funciona assim: criamos uma Stack para a animação sobrepor a tela;
// Em seguida, quando o Container sobrepor a tela, damos um .push na nova tela e enviamos
// o Container via Hero para a próxima tela. Na outra tela, devemos criar outra animação
// para o Container sumir.
class ScreenTransitionHome extends StatefulWidget {
  @override
  _ScreenTransitionHomeState createState() => _ScreenTransitionHomeState();
}

class _ScreenTransitionHomeState extends State<ScreenTransitionHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> containerSize;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    _controller.addStatusListener((status){
      if(status == AnimationStatus.completed){
        // Quando a animação acabar, empilhamos a próxima tela
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ScreenTransition2())
        );
      }
    });

    // Cria uma animação que varia de 0 à 1, que determinará o tamanho do Container animado.
    containerSize = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic
    );
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
              ),
              body: Center(
                child: FlatButton(
                  child: Text(
                    'Pressione aqui!',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: (){
                    // Inicia a animação
                    _controller.forward();
                  },
                ),
              ),
            ),

            // Centraliza o Container animado
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

import 'package:flutter/material.dart';

class StaggeredAnimationHome extends StatefulWidget {
  @override
  _StaggeredAnimationHomeState createState() => _StaggeredAnimationHomeState();
}

class _StaggeredAnimationHomeState extends State<StaggeredAnimationHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  // Devemos criar cada uma das animações. Nesse caso, a do tamanho do Container
  // e da sua cor.
  Animation<double> containerWidthAnimation;
  Animation<Color> colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));

    // O Container começará com 400 de largura e terminará com 200.
    containerWidthAnimation = Tween<double>(begin: 400.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic
      )
    );

    // O container irá de vermelho para azul. Preste atenção no parâmetro Interval!
    colorAnimation = ColorTween(
        begin: Color.fromRGBO(247, 64, 106, 1.0),
        end: Color.fromRGBO(0, 0, 106, 1.0)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.35, // Essa animação começa nos 35% do tempo total
          0.65, // e termina em 65% do tempo total!
          curve: Curves.easeInExpo
        )
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered Animation'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        // Para duas ou mais animações, enviamos o AnimationController _controller
        // ao invés da animação.
          animation: _controller,
          builder: (context, child){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: (){
                      if(_controller.isAnimating) return; // Ainda animando
                      if(!_controller.isCompleted) _controller.forward(); // Animação no início
                      else _controller.reverse(); // Animação completa
                    },
                    child:
                      _controller.isAnimating ?
                      CircularProgressIndicator() :
                      Text(
                        !_controller.isCompleted ? 'Iniciar animação de Tamanho e Cor' : 'Voltar animação',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                  SizedBox(height: 40.0,),
                  Container(
                    width: containerWidthAnimation.value,
                    color: colorAnimation.value,
                    height: 100.0,
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}

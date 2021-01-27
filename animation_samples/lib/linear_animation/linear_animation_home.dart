import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LinearAnimationHome extends StatefulWidget {
  @override
  _LinearAnimationHomeState createState() => _LinearAnimationHomeState();
}

class _LinearAnimationHomeState extends State<LinearAnimationHome> with SingleTickerProviderStateMixin {

  // Controller da Animação
  AnimationController _controller;

  // A animação fará um container crescer
  Animation<double> containerGrow;

  @override
  void initState() {
    super.initState();

    // Criando o Controller da animação
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2) // Duração da animação
    );

    // Criando a animação. O container vai crescer de 0 a 300
    containerGrow = Tween<double>(
      begin: 0,
      end: 300
    ).animate(_controller);

    // Inicia a animação
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
        title: Text('Linear Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: containerGrow, // Passando a animação como parâmetro
          builder: (context, child){
            return Container(
              color: Colors.red,
              width: containerGrow.value, // Vai de 0 até 300, conforme definido acima
              height: containerGrow.value,
              alignment: Alignment.center,
              child: Text(
                'Estou animado!',
                style: TextStyle(
                  fontSize: containerGrow.value * 0.20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
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

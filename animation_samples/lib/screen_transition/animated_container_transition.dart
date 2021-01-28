import 'package:flutter/material.dart';

class AnimatedContainerTransition extends StatelessWidget {

  final Animation<double> containerSize;

  AnimatedContainerTransition({@required this.containerSize});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Aumenta o container de acordo com o estado da animação
    return Hero(
      tag: 'containerGrowTransition',
      child: Container(
        width: screenWidth * containerSize.value,
        height: screenHeight * containerSize.value,
        color: Colors.red,
      )
    );
  }
}

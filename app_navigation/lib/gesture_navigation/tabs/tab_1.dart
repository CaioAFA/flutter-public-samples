import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Navigator'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Arraste para o lado\n',
                style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 60.0,
              )
            ],
          )
      ),
    );
  }
}

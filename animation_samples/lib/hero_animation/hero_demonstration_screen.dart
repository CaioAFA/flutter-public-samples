import 'package:flutter/material.dart';

class HeroDemonstrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Clique novamente para voltar!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              decoration: TextDecoration.none,
              color: Colors.black
            ),
          ),
          SizedBox(height: 40.0,),
          Material(
            color: Colors.white,
            child: GestureDetector(
              child: Hero(
                tag: 'starHero', // Devemos passar a mesma etiqueta criada anteriormente.
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 70,
                ),
              ),
              onTap: (){
                // Volta para a página anterior
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}

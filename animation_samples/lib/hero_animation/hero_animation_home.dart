import 'package:animation_samples/hero_animation/hero_demonstration_screen.dart';
import 'package:flutter/material.dart';

class HeroAnimationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40.0,),
          Text(
            'Clique na estrela',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 40.0,),
          Center(
            child: GestureDetector(
              child: Hero(
                tag: 'starHero', // Devemos criar uma etiqueta para o Hero e informar seu filho.
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 70,
                ),
              ),
              onTap: (){
                // Abre a nova tela com o Hero.
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HeroDemonstrationScreen())
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

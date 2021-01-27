import 'package:animation_samples/curve_animation/curve_animation_home.dart';
import 'package:animation_samples/linear_animation/linear_animation_home.dart';
import 'package:animation_samples/ping_pong_animation/ping_pong_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final TextStyle cardTextStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Useful Widgets'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _createCard(
              title: 'Linear Animation',
              imagePath: 'images/no-image.jpg',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LinearAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Ping Pong Animation',
              imagePath: 'images/no-image.jpg',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PingPongAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Curve Animation',
              imagePath: 'images/no-image.jpg',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CurveAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Novas Animações serão adicionadas aqui quando eu descobri-las!',
              imagePath: 'images/no-image.jpg',
              onTap: (){}
          ),
        ],
      ),
    );
  }

  Widget _createCard({@required String title, @required String imagePath, @required VoidCallback onTap}){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 5.0,
      child: InkWell( // Get Tap event
        onTap: onTap,
        child: Container(
          height: 200.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                  flex: 2,
                  child: Container(
                    child: AspectRatio(
                      aspectRatio: 0.9,
                      child: Image.asset(imagePath, fit: BoxFit.fill,),
                    ),
                  )
              ),
              Flexible(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible( // With this Flexible, text wraps if necessary.
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: cardTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:animation_samples/curve_animation/curve_animation_home.dart';
import 'package:animation_samples/linear_animation/linear_animation_home.dart';
import 'package:animation_samples/list_slide_animation/list_slide_animation_home.dart';
import 'package:animation_samples/loading_button_animation/loading_button_animation_home.dart';
import 'package:animation_samples/ping_pong_animation/ping_pong_home.dart';
import 'package:animation_samples/screen_transition/screen_transition_home.dart';
import 'package:animation_samples/staggered_animation/staggered_animation_home.dart';
import 'package:flutter/material.dart';

import 'hero_animation/hero_animation_home.dart';

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
              imagePath: 'images/animations_preview/linear-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LinearAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Ping Pong Animation',
              imagePath: 'images/animations_preview/ping-pong-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PingPongAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Curve Animation',
              imagePath: 'images/animations_preview/curve-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CurveAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Hero Animation',
              imagePath: 'images/animations_preview/hero-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HeroAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'List Slide Animation (Animação De Edge Insets - Margem)',
              imagePath: 'images/animations_preview/list-slide-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListSlideAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Screen Transition',
              imagePath: 'images/animations_preview/screen-transition-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ScreenTransitionHome())
                );
              }
          ),
          _createCard(
              title: 'Staggered Animation (Duas Ou Mais Animações Simultâneas)',
              imagePath: 'images/animations_preview/staggered-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StaggeredAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'Loading Button Animation',
              imagePath: 'images/animations_preview/loading-button-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoadingButtonAnimationHome())
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
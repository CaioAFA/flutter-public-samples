import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_navigation_samples/drawer_navigation/home.dart';
import 'package:flutter_navigation_samples/gesture_navigation/home.dart';
import 'package:flutter_navigation_samples/tab_navigation/home.dart';

class HomeScreen extends StatelessWidget {

  final TextStyle cardTextStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Navigation Samples'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _createCard(
              title: 'Drawer Navigation',
              imagePath: 'images/DrawerNavigation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>DrawerNavigationHome())
                );
              }
          ),
          _createCard(
              title: 'Gesture Navigation',
              imagePath: 'images/GestureNavigator.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>GestureNavigationHome())
                );
              }
          ),
          _createCard(
              title: 'Tab Navigation',
              imagePath: 'images/TabNavigation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>TabNavigationHome())
                );
              }
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
                    color: Colors.red,
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

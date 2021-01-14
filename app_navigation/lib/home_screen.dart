import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              onTap: (){}
          ),
          _createCard(
              title: 'Gesture Navigation',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>GestureNavigationHome())
                );
              }
          ),
          _createCard(
              title: 'Tab Navigation',
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
  
  Widget _createCard({@required String title, @required VoidCallback onTap}){
    return Card(
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
                    child: Image.network(
                      'https://media1.tenor.com/images/a4fc4e72e879f298b85e3f31fe89cc67/tenor.gif?itemid=14262407',
                      fit: BoxFit.fill,
                      loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null ?
                            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                : null,
                            backgroundColor: Colors.black,
                          ),
                        );
                      },
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

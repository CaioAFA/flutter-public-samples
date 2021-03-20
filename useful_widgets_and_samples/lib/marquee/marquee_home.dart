import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class MarqueeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marquee'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Textos Com Scroll',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'Marquee Básico',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 15,
              child: Marquee(
                text: 'There once was a boy who told this story about a boy: "',
              ),
            ),

            SizedBox(height: 15,),

            Text(
              'Marquee Com Várias Propriedades',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 15,
              child: Marquee(
                text: 'GeeksforGeeks is a one-stop destination for programmers.',
                style: TextStyle(fontWeight: FontWeight.bold),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 1),
                showFadingOnlyWhenScrolling: true,
                fadingEdgeStartFraction: 0.1,
                fadingEdgeEndFraction: 0.1,
                numberOfRounds: 3,
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            )
          ],
        ),
      ),
    );
  }
}

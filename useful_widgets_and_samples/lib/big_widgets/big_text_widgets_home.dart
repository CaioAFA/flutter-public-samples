import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:readmore/readmore.dart';

class BigTextWidgetsHome extends StatelessWidget {
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
            _renderTitle('Textos Com Scroll\n(Plugin Marquee)'),

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
            ),

            _renderDivider(),

            _renderTitle('Textos Escondidos\n(Plugin Readmore)'),

            SizedBox(height: 10,),
            ReadMoreText(
              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
              trimLines: 1,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue),
              lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.purple),
              style: TextStyle(
                color: Colors.black
              ),
            ),
            
            _renderDivider(),
            
            _renderTitle('InteractiveViewer'),

            Text(
              'Faça gestos de Zoom.'
            ),
            InteractiveViewer(
              child: Image.network(
                'https://cdn.swapps.com/uploads/2018/07/trying-out-flutter.jpg'
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderTitle(String title){
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 26,
      ),
    );
  }

  Widget _renderDivider(){
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Divider(),
    );
  }
}

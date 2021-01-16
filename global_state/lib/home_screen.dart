import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:global_data/provider/main_provider.dart';
import 'package:global_data/scoped_model/home_scoped_model.dart';

class HomeScreen extends StatelessWidget {

  final TextStyle cardTextStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Flutter Global Data'),
            Text(
              'Acessando o estado global do App',
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _createCard(
              title: 'Providers',
              imagePath: 'images/provider.jpg',
              plugins: ['provider: ^4.0.0'],
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>MainProvider())
                );
              }
          ),
          _createCard(
              title: 'Scoped Model',
              imagePath: 'images/scoped-model.jpg',
              plugins: ['scoped_model: ^1.0.1'],
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>HomeScopedModel())
                );
              }
          ),
        ],
      ),
    );
  }

  Widget _createCard({@required String title, @required List<String> plugins, @required String imagePath, @required VoidCallback onTap}){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      elevation: 5.0,
      child: InkWell( // Get Tap event
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(top: 4.0),
          height: 260.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
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
              Divider(),
              Text(
                ' Plugins:',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                plugins.map((plugin) => ' - ' + plugin).toList().join('\n'),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(imagePath, fit: BoxFit.fill,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
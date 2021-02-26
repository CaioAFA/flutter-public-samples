import 'package:flutter/material.dart';
import 'package:mobx_samples/computed_value/computed_value_home.dart';
import 'package:mobx_samples/global_state/global_state_home.dart';
import 'package:mobx_samples/list_observable/list_observable_home.dart';
import 'package:mobx_samples/reaction_sample/reaction_sample_home.dart';
import 'package:mobx_samples/simple_observable/simple_observable_home.dart';

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
              title: 'Observable Simples',
              imagePath: 'images/previews/simple-observable.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SimpleObservableHome())
                );
              }
          ),
          _createCard(
              title: 'Observable Com Estrutura De Dados (Exemplo Com List)',
              imagePath: 'images/previews/list-observable.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ListObservableHome())
                );
              }
          ),
          _createCard(
              title: 'Valor Computado',
              imagePath: 'images/previews/computed-value.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ComputedValueHome())
                );
              }
          ),
          _createCard(
              title: 'Reações (Exemplo Com Tela De Login)',
              imagePath: 'images/previews/reaction.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ReactionSampleHome())
                );
              }
          ),
          _createCard(
              title: 'Estado Global (Necessita Plugin Provider)',
              imagePath: 'images/previews/global-state.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GlobalStateHome())
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
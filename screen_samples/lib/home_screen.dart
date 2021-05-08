import 'package:flutter/material.dart';
import 'package:screen_samples/bloc_form_with_validator_and_loading/bloc_form_with_validator_and_loading_home.dart';
import 'package:screen_samples/bloc_list_with_filter/bloc_list_with_filter_home.dart';
import 'package:screen_samples/search_render_return/home.dart';
import 'package:screen_samples/search_return/home.dart';

import 'toggle_appear_button/toggle_appear_button_home.dart';

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
              title: 'BLoC - Lista com Filtro',
              imagePath: 'images/previews/bloc_list_with_filter.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BlocListWithFilterHome())
                );
              }
          ),
          _createCard(
              title: 'BLoC - Formulário Com Validação e Loading',
              imagePath: 'images/previews/bloc_form_with_validation_and_loading.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BlocFormWithValidatorAndLoadingHome())
                );
              }
          ),
          _createCard(
              title: 'Tela de Pesquisa 1 - Pesquisar e Retornar Resultado',
              imagePath: 'images/previews/search_return.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchReturnHome())
                );
              }
          ),
          _createCard(
              title: 'Tela de Pesquisa 2 - Pesquisar, Renderizar Widgets e Retornar Resultado',
              imagePath: 'images/previews/search_render_return.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchRenderReturnHome())
                );
              }
          ),
          _createCard(
              title: 'Scroll Toggle Button',
              imagePath: 'images/previews/scroll-toggle-button.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ToggleAppearButtonHome())
                );
              }
          ),
          _createCard(
              title: 'Novas Telas serão adicionadas aqui quando eu descobrir bons exemplos!',
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
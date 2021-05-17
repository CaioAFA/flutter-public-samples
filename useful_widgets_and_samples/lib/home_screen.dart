import 'package:flutter/material.dart';
import 'package:useful_widgets/alert_dialog_form/alert_dialog_form_home.dart';
import 'package:useful_widgets/appbar_seach/appbar_seach_home.dart';
import 'package:useful_widgets/big_widgets/big_text_widgets_home.dart';
import 'package:useful_widgets/binary_logic_select/binary_logic_select_home.dart';
import 'package:useful_widgets/custom_form_input/custom_form_input_home.dart';
import 'package:useful_widgets/drag_and_drop/drag_and_drop_home.dart';
import 'package:useful_widgets/dropdown_button/dropdown_button_home.dart';
import 'package:useful_widgets/infinite_scroll/infinite_scroll_screen.dart';
import 'package:useful_widgets/list_wheel_scroll_view/list_wheel_scroll_view_home.dart';
import 'package:useful_widgets/no_connection_block/no_connection_block_home.dart';
import 'package:useful_widgets/page_view_animation/page_view_animation_home.dart';
import 'package:useful_widgets/shimmer/shimmer_home.dart';

import 'alert_dialog_form/alert_dialog_form_home.dart';
import 'custom_scroll_view/custom_scroll_view_home.dart';

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
              title: 'Infinite Scroll\n(Lista Infinita)',
              imagePath: 'images/previews/infinite_scroll.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => InfiniteScrollSample())
                );
              }
          ),
          _createCard(
              title: 'AlertDialog Form',
              imagePath: 'images/previews/alert_dialog_form.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AlertDialogFormHome())
                );
              }
          ),
          _createCard(
              title: 'Custom Scroll View\n(Preste Atenção na AppBar)',
              imagePath: 'images/previews/custom-scroll-view.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CustomScrollViewHome())
                );
              }
          ),
          _createCard(
              title: 'Campo De Formulário Personalizado',
              imagePath: 'images/previews/custom_form_input.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CustomFormInputHome())
                );
              }
          ),
          _createCard(
              title: 'Shimmer',
              imagePath: 'images/previews/shimmer.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ShimmerHome())
                );
              }
          ),
          _createCard(
              title: 'Drag And Drop Sample',
              imagePath: 'images/previews/drag_and_drop.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DragAndDropHome())
                );
              }
          ),
          _createCard(
              title: 'Dropdown Button',
              imagePath: 'images/previews/dropdown-button.gif',
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DropdownButtonHome())
                );
              }
          ),
          _createCard(
              title: 'Widgets Para Encapsular Widgets Grandes (Necessita De Plugins)',
              imagePath: 'images/previews/big-widgets.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BigTextWidgetsHome())
                );
              }
          ),
          _createCard(
              title: 'Animação Com Page View',
              imagePath: 'images/previews/page-view-animation.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PageViewAnimationHome())
                );
              }
          ),
          _createCard(
              title: 'App Bar Search',
              imagePath: 'images/previews/appbar-search.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AppBarSearchHome())
                );
              }
          ),
          _createCard(
              title: 'Bloquear App Sem Conexão Com A Internet',
              imagePath: 'images/previews/no-connection-block.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NoConnectionBlockHome())
                );
              }
          ),
          _createCard(
              title: 'Selecionando Elementos Com Lógica Binária',
              imagePath: 'images/previews/binary-logic-select.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BinaryLogicSelectHome())
                );
              }
          ),
          _createCard(
              title: 'List Wheel Scroll View',
              imagePath: 'images/previews/list-wheel-scroll-view.gif',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListWheelScrollViewHome())
                );
              }
          ),
          _createCard(
              title: 'Novos Widgets serão adicionados aqui quando eu descobri-los!',
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: cardTextStyle,
                        ),
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
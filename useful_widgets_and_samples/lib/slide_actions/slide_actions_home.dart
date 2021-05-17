import 'package:flutter/material.dart';
import 'package:useful_widgets/slide_actions/dismissible_sample.dart';
import 'package:useful_widgets/slide_actions/slidable_sample.dart';

class SlideActionsHome extends StatelessWidget {

  void showSnackBar({@required String text, @required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ações com Slide'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _renderTitle('Dismissible - Nativo Do Flutter'),
          DismissibleSample(context: context, showSnackBar: showSnackBar),

          Divider(),

          _renderTitle('Slidable - Precisa do Plugin Slidable'),
          SlidableSample(context: context, showSnackBar: showSnackBar)
        ],
      ),
    );
  }

  Widget _renderTitle(String title){
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

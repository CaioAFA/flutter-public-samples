import 'package:flutter/material.dart';
import 'package:useful_widgets/slide_actions/slidable_sample.dart';

class SlideActionsHome extends StatelessWidget {

  void showSnackBar({@required String text, @required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      )
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
          SlidableSample(context: context, showSnackBar: showSnackBar,)
        ],
      ),
    );
  }
}

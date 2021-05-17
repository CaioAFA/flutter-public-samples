import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableSample extends StatelessWidget {

  SlidableSample({this.context, this.showSnackBar});

  final BuildContext context;
  final Function showSnackBar;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(), // Try all of the Slidable<X>ActionPane's!
      actionExtentRatio: 0.25, // Children's size (in %)
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('3'),
            foregroundColor: Colors.white,
          ),
          title: Text('Tile n°3'),
          subtitle: Text('SlidableDrawerDelegate'),
        ),
      ),

      // Slide from left to right
      actions: <Widget>[
        IconSlideAction(
          caption: 'Arquivar',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => showSnackBar(text: 'Arquivar', context: context),
        ),
        IconSlideAction(
          caption: 'Compartilhar',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => showSnackBar(text: 'Compartilhar', context: context),
        ),
      ],

      // Slide from right to left
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Mais',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => showSnackBar(text: 'Mais', context: context),
        ),
        IconSlideAction(
          caption: 'Deletar',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => showSnackBar(text: 'Deletar', context: context),
        ),
        IconSlideAction(
          caption: 'Copiar',
          color: Colors.yellow,
          icon: Icons.copy,
          onTap: () => showSnackBar(text: 'Copiar', context: context),
        ),
        IconSlideAction(
          caption: 'Mover',
          color: Colors.pink,
          icon: Icons.drive_file_move,
          onTap: () => showSnackBar(text: 'Mover', context: context),
        ),
      ],
    );
  }
}

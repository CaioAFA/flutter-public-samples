import 'package:flutter/material.dart';

class DismissibleSample extends StatelessWidget {

  DismissibleSample({this.context, this.showSnackBar});

  final BuildContext context;
  final Function showSnackBar;

  final itemList = ['Item1', 'Item2', 'Item3'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: itemList.map((item) => Dismissible(
        key: Key(item),

        onDismissed: (DismissDirection direction) {
          print(direction);

          if(direction == DismissDirection.startToEnd)
            showSnackBar(text: '$item Arquivado!', context: context);

          if(direction == DismissDirection.endToStart)
            showSnackBar(text: '$item Deletado!', context: context);
        },

        // Swipe from left to right
        background: Container(
          color: Colors.green,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 15),
          child: Icon(
            Icons.archive,
            color: Colors.white,
          ),
        ),

        // Swipe from right to left
        secondaryBackground: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),

        child: ListTile(
            leading: CircleAvatar(
              child: Text(
                item[item.length - 1],
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              backgroundColor: Colors.red,
            ),
            title: Text(item)
        ),
      )).toList(),
    );
  }
}

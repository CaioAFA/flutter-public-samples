import 'package:flutter/material.dart';

class CustomScrollViewSliverList extends StatelessWidget {

  final getRandomColor;

  CustomScrollViewSliverList(this.getRandomColor);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          for(var i = 0; i < 10; i++)
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4.0),
              tileColor: getRandomColor(),
              title: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(i.toString()),
              ),
            )
        ]
      ),
    );
  }
}

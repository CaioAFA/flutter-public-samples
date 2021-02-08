import 'package:flutter/material.dart';

class CustomScrollViewSliverListSample extends StatelessWidget {

  final getRandomColor;

  CustomScrollViewSliverListSample(this.getRandomColor);

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

import 'package:flutter/material.dart';

class CustomScrollViewSliverGridSample extends StatelessWidget {

  final getRandomColor;

  CustomScrollViewSliverGridSample(this.getRandomColor);

  @override
  Widget build(BuildContext context) {
    List<int> data = [];
    for(var i = 0; i < 21; i++){
      data.add(i+1);
    }

    return SliverGrid(
      // We can create grid by number of Widgets per line, max width per line, etc.
      // In this case, we're using 3 Widgets per line.
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0.0, // Vertical Margin
        crossAxisSpacing: 0.0, // Horizontal Margin
        childAspectRatio: 1.0 // 1 = Square. < 1 = vertical square. > 1 = horizontal square.
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
            alignment: Alignment.center,
            color: getRandomColor(),
            child: Text(
              'Grid Item ${data[index].toString()}',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: getRandomColor()
              ),
            ),
          );
        },
        childCount: data.length,
      ),
    );
  }
}

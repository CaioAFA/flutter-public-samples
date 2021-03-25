import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

import 'package:useful_widgets/page_view_animation/page_view_animation_item.dart';

class PageViewAnimationHome extends StatefulWidget {

  @override
  _PageViewAnimationHomeState createState() => _PageViewAnimationHomeState();
}

class _PageViewAnimationHomeState extends State<PageViewAnimationHome> {

  // To create this animation, we nede to create a Page View

  // First, we need a pageController with viewportFraction to see more than
  // one page on the screen.
  final PageController pageController = PageController(viewportFraction: 0.4);

  // Will save the current page. This value is double: when on first page, the value
  // is 0. When on second page, the value is 1. When it's between the first and second
  // page, the value is 0.5. This way we can calculate the size of Widgets!
  double currentPage = 0;

  // Items to be rendered
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    // Here, we refresh currentPage value. When the user scrolls, currentPage
    // will be updated.
    pageController.addListener(() {
        setState(() {
          currentPage = pageController.page;
        });
    });

    // Creating the items
    for(int i = 0; i < 100; i++)
      items.add({
        'text': i.toString(),
        'backgroundColor': _getRandomColor(),
        'textColor': _getRandomColor()
      });
  }

  Color _getRandomColor(){
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View Animation'),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: items.length,
        itemBuilder: (context, index){

          // This value is how much the Widget is away from the center. With it,
          // we can do the magic! We can consider "index" as the page:
          // Index 0 -> Page 0
          // Index 1 -> Page 1...
          double awayFromCenterOffset = (index - currentPage).abs();

          return Center(
            child: PageViewAnimationItem(
              backgroundColor: items[index]['backgroundColor'],
              textColor: items[index]['textColor'],
              text: items[index]['text'],
              awayFromCenterOffset: awayFromCenterOffset,
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:useful_widgets/custom_scroll_view/sliver_appbar.dart';
import 'package:useful_widgets/custom_scroll_view/sliver_grid.dart';
import 'dart:math' as math;
import 'package:useful_widgets/custom_scroll_view/sliver_list.dart';

class CustomScrollViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // In this case, we don't create an AppBar at the Scaffold Widget!
    // We create at the CustomScrollView.
    return Scaffold(
      body: CustomScrollView(
        // Inside one CustomScrollView, all childrens must be "Slivers"
        slivers: [

          CustomScrollViewSliverAppBar(),

          // Sample function that creates a "Container Sliver"
          _createSliverBox(
              title: 'Tudo deve ser Sliver dentro de um Custom Scroll View!',
              color: Colors.red
          ),
          _createSliverBox(
              title: 'Exemplo de uma Lista Simples!',
              color: Colors.pinkAccent
          ),

          // Sliver List Sample
          CustomScrollViewSliverListSample(getRandomColor),

          _createSliverBox(
              title: 'Exemplo de um Grid!',
              color: Colors.pinkAccent
          ),

          // Sliver Grid Sample
          CustomScrollViewSliverGridSample(getRandomColor)
        ],
      ),
    );
  }

  Color getRandomColor(){
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  Widget _createSliverBox({@required String title, @required Color color}){
    return SliverToBoxAdapter(
      child: Container(
        height: 120.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

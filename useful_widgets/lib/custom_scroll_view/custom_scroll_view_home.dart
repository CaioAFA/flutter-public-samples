import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;
import 'package:useful_widgets/custom_scroll_view/sliver_list.dart';

class CustomScrollViewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // In this case, we don't create an AppBar at the Scaffold Widget!
    return Scaffold(
      body: CustomScrollView(
        // Inside one CustomScrollView, all childrens must be "Slivers"
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false, // Disappear when scroll down
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Custom Scroll View!'),
              centerTitle: true,
            ),
          ),

          // Sample function that creates a "Container Sliver"
          _createSliverBox(
              title: 'Tudo deve ser Sliver dentro de um Custom Scroll View!',
              color: Colors.red
          ),
          _createSliverBox(
              title: 'Exemplo de uma Lista Simples!',
              color: Colors.greenAccent
          ),

          // List Sliver sample
          CustomScrollViewSliverList(getRandomColor)
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
          border: Border.all(
            color: Colors.black,
            width: 10,
            style: BorderStyle.solid
          )
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

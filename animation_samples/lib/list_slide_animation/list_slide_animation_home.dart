import 'package:flutter/material.dart';

class ListSlideAnimationHome extends StatefulWidget {
  @override
  _ListSlideAnimationHomeState createState() => _ListSlideAnimationHomeState();
}

class _ListSlideAnimationHomeState extends State<ListSlideAnimationHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<EdgeInsets> listSlidePosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));

    // As margens dos itens da lista irão de 0 até 80.
    listSlidePosition = EdgeInsetsTween(
      begin: EdgeInsets.only(top: 0),
      end: EdgeInsets.only(top: 80)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic
      )
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Slide Animation'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
          animation: listSlidePosition,
          builder: (context, child){
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                // No início, os itens da lista estarão um em cima do outro. Por isso,
                // utilizamos o Stack! Eles se ajeitarão através da margem.
                Stack(
                  children: [
                    _createListItem(title: 'Titulo 1', index: 0),
                    _createListItem(title: 'Titulo 2', index: 1),
                    _createListItem(title: 'Titulo 3', index: 2),
                    _createListItem(title: 'Titulo 4', index: 3),
                    _createListItem(title: 'Titulo 5', index: 4),
                    _createListItem(title: 'Titulo 6', index: 5),
                    _createListItem(title: 'Titulo 7', index: 6),
                    _createListItem(title: 'Titulo 8', index: 7),
                    _createListItem(title: 'Titulo 9', index: 8),
                    _createListItem(title: 'Titulo 10', index: 9),
                    _createListItem(title: 'Titulo 11', index: 10),
                  ],
                )
              ],
            );
          }
      ),
    );
  }

  Widget _createListItem({@required String title, @required double index}){
    return Container(
      height: 80.0,

      // Cálculo para que os elementos da lista se ajeitem através da margem
      margin: listSlidePosition.value * index,
      child: Card(
        elevation: 5.0,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

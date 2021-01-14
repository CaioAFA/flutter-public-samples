import 'package:flutter/material.dart';

class TabNavigationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Navigation'),
          centerTitle: true,

          // Herem we add the buttons to change the Tab
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              // Icon Buttons to change Tab
              Tab(icon: Icon(Icons.lightbulb)), // Redirect to index 0 page
              Tab(icon: Icon(Icons.android)), // Redirect to index 1 page
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // This doesn't let the user change the tab by sliding his finger
          children: [
            Center( // INDEX 0 PAGE
              child: Text(
                'Imagine aqui um conteúdo bonito!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Center( // INDEX 1 PAGE
              child: Text(
                'Imagine aqui outro conteúdo muito mais bonito!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

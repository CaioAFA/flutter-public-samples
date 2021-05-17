import 'package:flutter/material.dart';

class ListWheelScrollViewHome extends StatefulWidget {

  @override
  _ListWheelScrollViewHomeState createState() => _ListWheelScrollViewHomeState();
}

class _ListWheelScrollViewHomeState extends State<ListWheelScrollViewHome> with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Text('Básico'),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
        title: Text('List Wheel Scroll View'),
        centerTitle: true,
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:useful_widgets/list_wheel_scroll_view/basic_list_wheel.dart';
import 'package:useful_widgets/list_wheel_scroll_view/magnification_list_wheel.dart';
import 'package:useful_widgets/list_wheel_scroll_view/offset_axis_list_wheel.dart';

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
            Tab(text: 'Básico',),
            Tab(text: 'Offset Axis',),
            Tab(text: 'Magnification',),
          ],
        ),
        title: Text('List Wheel Scroll View'),
        centerTitle: true,
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          BasicListWheel(),
          OffsetAxisListWheel(),
          MagnificationListWheel(),
        ],
      ),
    );
  }
}

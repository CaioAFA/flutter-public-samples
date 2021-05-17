import 'package:flutter/material.dart';
import 'package:useful_widgets/list_wheel_scroll_view/generate_containers.dart';

class BasicListWheel extends StatelessWidget {

  final List<Widget> children = generateContainers();

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: ,
      children: children
    );
  }
}

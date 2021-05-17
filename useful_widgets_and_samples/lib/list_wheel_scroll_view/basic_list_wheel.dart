import 'package:flutter/material.dart';
import 'package:useful_widgets/list_wheel_scroll_view/generate_containers.dart';

class BasicListWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = generateContainers(context);

    return ListWheelScrollView(
      itemExtent: 200, // Item Height
      squeeze: 0.8, // Distance of Widgets
      children: children,
      onSelectedItemChanged: (int index){
        print(index);
      },
    );
  }
}

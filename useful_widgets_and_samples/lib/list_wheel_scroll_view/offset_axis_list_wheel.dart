import 'package:flutter/material.dart';
import 'package:useful_widgets/list_wheel_scroll_view/generate_containers.dart';

class OffsetAxisListWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = generateContainers(context);

    return ListWheelScrollView(
      itemExtent: 200,
      squeeze: 0.8,
      children: children,
      offAxisFraction: -0.8,
    );
  }
}

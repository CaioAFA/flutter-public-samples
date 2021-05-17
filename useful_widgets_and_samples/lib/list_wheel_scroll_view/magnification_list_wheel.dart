import 'package:flutter/material.dart';
import 'package:useful_widgets/list_wheel_scroll_view/generate_containers.dart';

class MagnificationListWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = generateContainers(context);

    return ListWheelScrollView(
      itemExtent: 200,
      children: children,
      useMagnifier: true,
      magnification: 1.5,
      diameterRatio: 10,
    );
  }
}

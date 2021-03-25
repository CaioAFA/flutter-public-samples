import 'package:flutter/material.dart';

// To calc inversely proportional values (less awayFromCenterOffset -> biggest value):
// Value * (1 - awayFromCenterOffset)

// To calc proportional values (more awayFromCenterOffset -> biggest value):
// Value * awayFromCenterOffset

class PageViewAnimationItem extends StatelessWidget {

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double awayFromCenterOffset;

  PageViewAnimationItem({@required this.backgroundColor, @required this.textColor, @required this.text, @required this.awayFromCenterOffset});

  @override
  Widget build(BuildContext context) {
    double fullBoxSize = 250;
    double minBoxSize = 50;

    double boxSize = fullBoxSize * (1 - awayFromCenterOffset);
    boxSize = boxSize > minBoxSize ? boxSize : minBoxSize;

    double marginTop = 150 * awayFromCenterOffset;
    marginTop = marginTop > 0 ? marginTop : 0;

    double minFontSize = 10;
    double fontSize = 40 * (1 - awayFromCenterOffset);
    fontSize = fontSize > minFontSize ? fontSize : minFontSize;

    return Container(
      height: boxSize,
      width: boxSize,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: marginTop),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}

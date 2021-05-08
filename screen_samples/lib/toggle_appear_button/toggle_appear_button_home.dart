import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// To create this effect, we need to create a ScrollController.
// Then, we listen: when he goes up, we animate the button to page.
// Else, we send the button out.
class ToggleAppearButtonHome extends StatefulWidget {

  @override
  _ToggleAppearButtonHomeState createState() => _ToggleAppearButtonHomeState();
}

class _ToggleAppearButtonHomeState extends State<ToggleAppearButtonHome>
  with SingleTickerProviderStateMixin {

  final ScrollController scrollController = ScrollController();

  AnimationController animationController;
  Animation<double> buttonAnimation;

  final double buttonHeight = 50;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this, duration: Duration(seconds: 1));

    // buttonHeight + 16 to crete a small empty space on the screen bottom.
    buttonAnimation = Tween<double>(begin: 0, end: buttonHeight + 16).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 0.6), // Animation begin at 40% to 60% of animation time.
                                   // This delay creates a good effect.
      ),
    );

    // Creating the listener
    scrollController.addListener(scrollChanged);

    // When the user open the Screen, the button is animated
    animationController.forward();
  }

  // This will execute after any scroll event
  void scrollChanged() {
    final s = scrollController.position;
    if (s.userScrollDirection == ScrollDirection.forward) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Toggle Button'),
        centerTitle: true,
      ),
      body: Stack( // We use a stack to insert the button above everything
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 200,),
                Text(
                  'Arraste para baixo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  size: 70,
                ),
                SizedBox(height: 600,),
                Icon(
                  Icons.arrow_upward,
                  size: 70,
                ),
                Text(
                  'Arraste para Cima',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 200,)
              ],
            ),
          ),

          // ANIMATED BUTTON
          AnimatedBuilder(
            animation: buttonAnimation,
            builder: (_, __) {
              return Positioned(
                bottom: -buttonHeight + buttonAnimation.value, // This makes the button appear
                left: 0,
                right: 0,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: renderButtonContent(),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget renderButtonContent(){
    return Container(
      height: buttonHeight,
      child: RaisedButton(
        color: Colors.orange,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                'Do Something!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

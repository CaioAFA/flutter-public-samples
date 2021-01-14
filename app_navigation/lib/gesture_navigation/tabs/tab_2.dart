import 'package:flutter/material.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Essa navegação pode ser muito útil para criação de tutoriais...',
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 26.0
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0,),
          Icon(
            Icons.arrow_forward_rounded,
            size: 60.0,
            color: Colors.white,
          ),
          SizedBox(height: 40.0,),
        ],
      ),
    );
  }
}

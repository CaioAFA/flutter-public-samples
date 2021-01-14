import 'package:flutter/material.dart';

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Utilize com sabedoria ;)',
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 26.0
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0,),
          Icon(
            Icons.check,
            size: 60.0,
            color: Colors.white,
          ),
          SizedBox(height: 40.0,),
        ],
      ),
    );
  }
}

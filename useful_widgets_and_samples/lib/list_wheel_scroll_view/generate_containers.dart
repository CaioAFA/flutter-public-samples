import 'dart:math';
import 'package:flutter/material.dart';

List<Widget> generateContainers(BuildContext context){
  List<Widget> list = [];

  final double screenWidth = MediaQuery.of(context).size.width - 20;

  for(int i = 0; i < 50; i++){
    list.add(
      Container(
        width: screenWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: _generateRandomColor(),
          boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(2, 5), blurRadius: 20)
          ]
        ),
        child: CircleAvatar(
          child: Text(
            i.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35
            ),
          ),
          backgroundColor: _generateRandomColor(),
          maxRadius: 35,
        ),
      )
    );
  }

  return list;
}

Color _generateRandomColor(){
  return Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
import 'package:flutter/material.dart';

class ExitDrawerTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material( // Without Material, we dont have touch visual effect
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          // Pop a screen from the Stack
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: [
              Icon(
                  Icons.close_rounded,
                  size: 32.0,
                  color: Colors.red[700]
              ),
              SizedBox(width: 32.0,),
              Text(
                'Sair',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red[700]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

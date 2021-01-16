import 'package:flutter/material.dart';
import 'package:global_data/scoped_model/model/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';

class AccessModelMethod1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, child, model){
        // We can access the CounterModel1 by the variable "model"
        return Container(
          height: 200.0,
          child: Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Center(
              child: model.isLoading ? // Accessing the model
              CircularProgressIndicator() :
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Exemplo de função e variável de um Model (modo 1):\n\n${model.counter}', // Accessing the model
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      model.increment(); // Accessing the model
                    },
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_samples/computed_value/stores/computed_value_store.dart';

class ComputedValueHome extends StatelessWidget {

  final ComputedValueStore computedValueStore = ComputedValueStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valor Computado'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Flexible(
                  child: TextField(
                    onChanged: computedValueStore.changeFirstname,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                SizedBox(width: 15.0,),
                Flexible(
                  child: TextField(
                    onChanged: computedValueStore.changeLastname,
                    decoration: InputDecoration(
                      labelText: 'Sobrenome',
                      border: OutlineInputBorder()
                    ),
                  ),
                )
              ],
            ),

            SizedBox(height: 20.0,),

            // Computed values are the same as observables: it needs an Observer
            // Widget to detect changes
            Observer(
              builder: (context){
                return Text(
                  'Seu nome completo é:\n${computedValueStore.fullname}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

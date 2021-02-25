import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_samples/simple_observable/stores/simple_observable_store.dart';

class SimpleObservableHome extends StatelessWidget {

  // Creating the store
  final SimpleObservableStore simpleObservableStore;
  SimpleObservableHome() :
    simpleObservableStore = SimpleObservableStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obervable Simples'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: simpleObservableStore.incrementCount, // This way we can get states and actions of the store
      ),
      body: Center(
        child: Observer( // The UI changes only if the states are inside an Observer Widget!
          builder: (context){
            return Text(
              'Você apertou ${simpleObservableStore.count} vezes!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_samples/list_observable/stores/list_observable_store.dart';

class ListObservableHome extends StatelessWidget {

  // Creating the store
  final ListObservableStore listObservableStore = ListObservableStore();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Observable com Estrutura de Dados', style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adicione um Elemento'
                    ),
                    autofocus: true,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send,),
                  onPressed: (){
                    String newElement = textEditingController.text;

                    // Calling an action to add element to list
                    listObservableStore.addToList(newElement);

                    textEditingController.text = '';
                  },
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Expanded(
              // Observer to detected state changes and update the interface
              child: Observer(
                builder: (context){
                  return ListView(
                    // We'll create a List Tile for each element in list
                    children: listObservableStore.list.map((element){
                      return ListTile(
                        title: Text(element),
                        onLongPress: (){
                          listObservableStore.removeElement(element);
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

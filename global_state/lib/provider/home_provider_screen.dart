import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/my_model.dart';

class HomeProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // We can access the model using that way:
    MyModel myModel = Provider.of<MyModel>(context);
    Map<String, int> items = myModel.items; // Accessing the Model attribute

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
        centerTitle: true,
      ),
      body: myModel.isLoading ?
        Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Carregando...',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0,),
            CircularProgressIndicator()
          ],
        ),) :
        ListView(
          children: myModel.items.keys.map((item){
            return Card(
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Text(
                    item,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlatButton(
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        color: Colors.lightBlueAccent,
                        minWidth: 10.0,
                        onPressed: (){
                          myModel.decreaseItem(item);
                        },
                      ),
                      Text(
                        items[item].toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          '+',
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        color: Colors.lightBlueAccent,
                        minWidth: 10.0,
                        onPressed: (){
                          myModel.incrementItem(item);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                ],
              )
            );
          }).toList(),
        ),
    );
  }
}

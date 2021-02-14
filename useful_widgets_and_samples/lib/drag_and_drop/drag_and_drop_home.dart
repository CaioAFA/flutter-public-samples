import 'package:flutter/material.dart';

class DragAndDropHome extends StatefulWidget {

  @override
  _DragAndDropHomeState createState() => _DragAndDropHomeState();
}

class _DragAndDropHomeState extends State<DragAndDropHome> {
  List<String> _foodList = ['Abacaxi', 'Croquete', 'Pão', 'Maçã', 'Kibe'];
  List<String> _fruitList = [];

  List<String> _fruits = ['Abacaxi', 'Maçã'];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Drag And Drop'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.undo),
            tooltip: 'Reset',
            onPressed: (){
              setState(() {
                _foodList = ['Abacaxi', 'Croquete', 'Pão', 'Maçã', 'Kibe'];
                _fruitList = [];
              });
            }),
          IconButton(
            icon: Icon(Icons.check),
            tooltip: 'Checar',
            onPressed: (){
              bool error = false;

              if(_fruitList.length == 0) error = true;
              else if(_fruitList.length != _fruits.length) error = true;
              else
                for(String food in _fruitList){
                  if(!_fruits.contains(food)){
                    error = true;
                    break;
                  }
                }

              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  backgroundColor: error ? Colors.red : Colors.green,
                  content: Text(
                    error ? 'Verifique sua lista de frutas!' : 'Correto!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                )
              );
            }),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                'Mova somente as frutas para a coluna da direita',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 40.0,),
              Container(
                height: 300,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 200,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _foodList.length != 0 ? _foodList.map((food){

                            // Allow the drag and drop
                            return Draggable<String>(

                              // Data to transfer
                              data: food,

                              // Place the "feedback" under the pointer
                              dragAnchor: DragAnchor.pointer,

                              // What should appear at your finger location
                              feedback: Material(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(food[0], style: TextStyle(color: Colors.white,),),
                                      backgroundColor: Colors.red,
                                    ),
                                    title: Text(food, style: TextStyle(fontSize: 18),),
                                  ),
                                ),
                              ),

                              // Placeholder when dragging
                              childWhenDragging: ListTile(
                                enabled: false,
                                tileColor: Colors.grey,
                              ),

                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(food[0], style: TextStyle(color: Colors.white,),),
                                  backgroundColor: Colors.red,
                                ),
                                title: Text(food, style: TextStyle(fontSize: 18),),
                              ),
                            );
                          }).toList() : [Container()],
                        ),
                      ),
                    ),
                    _renderDivider(),
                    Flexible(
                      flex: 200,
                      child: Container(

                        // We need to place the draggable widgets here!
                        child: DragTarget<String>(

                          // Accept (return true) or not (return false) the data?
                          onWillAccept: (String food){
                            return true;
                          },

                          // If accept, what should we do?
                          onAccept: (String food){
                            setState(() {
                              _foodList.remove(food);
                              _fruitList.add(food);
                            });
                          },

                          builder: (context, List<String> candidateData, rejectedData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: _fruitList.length != 0 ? _fruitList.map((fruit){
                                return ListTile(
                                  leading: CircleAvatar(
                                    child: Text(fruit[0], style: TextStyle(color: Colors.white,),),
                                    backgroundColor: Colors.red,
                                  ),
                                  title: Text(fruit, style: TextStyle(fontSize: 18),),
                                );
                              }).toList() : [Container()],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderDivider(){
    return Flexible(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5)
        ),
      ),
    );
  }
}

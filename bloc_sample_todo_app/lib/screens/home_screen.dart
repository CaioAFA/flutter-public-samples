import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bloc_sample_todo_app/blocs/todo_bloc.dart';
import 'package:bloc_sample_todo_app/models/todo_model.dart';
import 'package:bloc_sample_todo_app/widgets/create_todo_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bloc_sample_todo_app/widgets/tutorial.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // With this Var, we can access variables and methods from BLoC.
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo - BLoC Pattern'),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.help_outline_rounded), onPressed: (){
            showTutorial(context);
          }),
          StreamBuilder<Map<String, Todo>>(
            stream: todoBloc.todoListOutput,
            initialData: {},
            builder: (context, snapshot){
              final int todoListLength = snapshot.data.keys.length;

              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 6.0),
                child: Text(
                  '${todoListLength.toString()} ${todoListLength == 1 ? 'Item' : 'Itens'}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newTodoData = await showCreateTodoAlertDialog(context);

          if(newTodoData == null) return;

          todoBloc.addTodo(
            newTodoData['title'],
            newTodoData['description']
          );
        },
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: StreamBuilder<Map<String, Todo>>(
        stream: todoBloc.todoListOutput,
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: Text('Adicione uma tarefa ;)'),
            );
          }

          // We can get the Stream Output data with snapshot.data
          return ListView(
            children: snapshot.data.values.map((todo){
              return _createTodoCard(todo, context);
            }).toList(),
          );
        },
      ),
    );
  }
  
  Widget _createTodoCard(Todo todo, BuildContext context){
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Card(
      elevation: 10.0,
      child: Dismissible(
          key: Key(todo.id.toString()),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            bool deleteTodo = await _confirmDismissTodo(todo, context);

            if(deleteTodo){
              todoBloc.removeTodoById(todo.id);
              return true;
            }
            return false;
          },
          background: Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Icon(
                    Icons.delete_outline_rounded,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Checkbox(
                        value: todo.isDone,
                        onChanged: (bool value){
                          todoBloc.toggleTodoById(todo.id);
                        }
                    ),
                    Text(
                      todo.title,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none
                      ),
                    )
                  ],
                ),
                Text(
                  todo.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                      decoration: todo.isDone ? TextDecoration.lineThrough : TextDecoration.none
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  Future<bool> _confirmDismissTodo(Todo todo, BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar"),
          content: Text("Você realmente deseja excluir a tarefa ${todo.title}?"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("CANCELAR"),
            ),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Text("DELETAR", style: TextStyle(color: Colors.white),)
            ),
          ],
        );
      },
    );
  }
}

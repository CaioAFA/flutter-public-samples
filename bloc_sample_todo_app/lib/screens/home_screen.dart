import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bloc_sample_todo_app/blocs/todo_bloc.dart';
import 'package:bloc_sample_todo_app/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          final newTodoData = await _showCreateTodoAlertDialog(context);

          if(newTodoData.keys.length > 0){
            todoBloc.addTodo(
              newTodoData['title'],
              newTodoData['description']
            );
          }
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

  Future<Map<String, dynamic>> _showCreateTodoAlertDialog(BuildContext context){
    final _formKey = GlobalKey<FormState>();

    final _createTodoTitleController = TextEditingController();
    final _createTodoDescriptionController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Criar Tarefa'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _createTodoTitleController,
                  decoration: InputDecoration(
                    hintText: 'Título'
                  ),
                  validator: (value){
                    if(value.isEmpty) return 'Preencha esse campo!';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _createTodoDescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Decrição',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 4,
                  textAlign: TextAlign.justify,
                  validator: (value){
                    if(value.isEmpty) return 'Preencha esse campo!';
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: const Text("Cancelar",),
              onPressed: () {
                Navigator.of(context).pop(<String, dynamic>{});
              },
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text("Criar", style: TextStyle(color: Colors.white),),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.of(context).pop({
                    'title': _createTodoTitleController.text,
                    'description': _createTodoDescriptionController.text
                  });
                }
              },
            ),
          ],
        );
      }
    );
  }
}

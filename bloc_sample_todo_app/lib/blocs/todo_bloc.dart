import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bloc_sample_todo_app/models/todo_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoBloc implements BlocBase{

  // Structure: todoId => TodoModel
  Map<String, Todo> _todoMap = {};

  // Create the Stream
  final _todoController = BehaviorSubject<Map<String, Todo>>();

  // Get the Stream output
  Stream <Map<String, Todo>> get todoListOutput => _todoController.stream;

  // Execute on App Start
  TodoBloc(){
    _loadSavedTodoList();
  }

  void addTodo(String title, String description){
    int todoId = new DateTime.now().microsecondsSinceEpoch;
    bool todoIsDone = false;
    Todo newTodo = Todo(todoId, title, description, todoIsDone);

    _todoMap[todoId.toString()] = newTodo;

    // Send the new todoMap to Widgets
    _todoController.sink.add(_todoMap);

    _saveTodoList();
  }

  void removeTodoById(int id){
    _todoMap.remove(id.toString());

    _saveTodoList();
    _todoController.sink.add(_todoMap);
  }

  void toggleTodoById(int id){
    _todoMap[id.toString()].toggleIsDone();

    _saveTodoList();
    _todoController.sink.add(_todoMap);
  }

  void _saveTodoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('todoList', json.encode(_todoMap));
  }

  void _loadSavedTodoList(){
    SharedPreferences.getInstance().then((prefs){
      Map<String, dynamic> todoListJson = json.decode(prefs.getString('todoList'));
      Map<String, Todo> loadedTodoMap = {};

      // Parse Json's to To do Models
      todoListJson.keys.forEach((key){
        loadedTodoMap[key] = Todo.fromJson(todoListJson[key]);
      });

      // Load the data and updates the interface
      _todoMap = loadedTodoMap;
      _todoController.sink.add(loadedTodoMap);
    });
  }

  // You must implement this method.
  @override
  void dispose() {
    // Always close the Stream!
    _todoController.close();
  }
}
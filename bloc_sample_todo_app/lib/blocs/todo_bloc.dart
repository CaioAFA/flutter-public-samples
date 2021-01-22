import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bloc_sample_todo_app/models/todo_model.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc implements BlocBase{

  // Structure: todoId => TodoModel
  Map<String, Todo> _todoMap = {};

  // Create the Stream
  final _todoController = BehaviorSubject<Map<String, Todo>>();

  // Get the Stream output
  Stream <Map<String, Todo>> get todoListOutput => _todoController.stream;

  // Execute on App Start
  TodoBloc(){
    addTodo('Titulo 1', 'Descrição 1');
    addTodo('Titulo 2', 'Descrição 2');
  }

  void addTodo(String title, String description){
    int todoId = new DateTime.now().microsecondsSinceEpoch;
    bool todoIsDone = false;
    Todo newTodo = Todo(todoId, title, description, todoIsDone);

    _todoMap[todoId.toString()] = newTodo;

    // Send the new todoMap to Widgets
    _todoController.sink.add(_todoMap);
  }

  void removeTodoById(int id){
    _todoMap.remove(id.toString());

    _todoController.sink.add(_todoMap);
  }

  void toggleTodoById(int id){
    _todoMap[id.toString()].toggleIsDone();

    _todoController.sink.add(_todoMap);
  }

  // You must implement this method.
  @override
  void dispose() {
    // Always close the Stream!
    _todoController.close();
  }

}
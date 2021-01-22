import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:bloc_sample_todo_app/blocs/todo_bloc.dart';
import 'package:bloc_sample_todo_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: TodoBloc(),
      child: MaterialApp(
        title: 'ToDo - BLoC Pattern',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
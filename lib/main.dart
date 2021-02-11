import 'package:flutter/material.dart';
import 'package:flutter_todos_app/todo_list_screen.dart';

void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos App',
      home: TodoListScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todos_app/todo_entity.dart';
import 'package:flutter_todos_app/todo_list_screen.dart';

/*
TODO:
- [DONE] TodosApp
- [DONE] TodoEntity
- [DONE] Todo screen
- [DONE] Todo list
- [DONE] Add todo dialog
- [DONE] Navigation to dialog
- [DONE] Remove done logic
- [DONE] Test scenarios
 */
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

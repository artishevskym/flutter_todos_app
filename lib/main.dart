import 'package:flutter/material.dart';
import 'package:flutter_todos_app/todo_entity.dart';

/*
TODO:
- [DONE] Todos App
- Todo entity
- Todo screen
- Todo list
- Add todo dialog
- Navigation to dialog
- Remove done logic
 */
void main() => runApp(TodosApp());

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoEntity entity = TodoEntity(title: '');

    return MaterialApp(
      title: 'Todos App',
      home: Scaffold(),
    );
  }
}

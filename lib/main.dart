import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Todos App',
      home: Scaffold(),
    );
  }
}

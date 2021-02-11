import 'package:flutter/material.dart';
import 'package:flutter_todos_app/todo_entity.dart';

class AddTodoDialog extends StatelessWidget {
  final controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Add a todo'),
        content: TextField(
          controller: controller,
          autofocus: true,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Add'),
            onPressed: () {
              final todo = new TodoEntity(title: controller.value.text);
              controller.clear();
              Navigator.of(context).pop(todo);
            },
          ),
        ]);
  }
}

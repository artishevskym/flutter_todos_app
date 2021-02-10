import 'package:flutter/material.dart';
import 'package:flutter_todos_app/todo_entity.dart';

class TodoList extends StatelessWidget {
  final List<TodoEntity> todoList;

  TodoList({@required this.todoList});

  Widget _buildItem(BuildContext context, int index) {
    final todo = todoList[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todoList.length,
    );
  }
}

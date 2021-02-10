import 'package:flutter/material.dart';
import 'package:flutter_todos_app/todo_entity.dart';

typedef TodoToggleCallback = void Function(TodoEntity, bool);

class TodoList extends StatelessWidget {
  final List<TodoEntity> todoList;
  final TodoToggleCallback onTodoToggle;

  TodoList({@required this.todoList, this.onTodoToggle});

  Widget _buildItem(BuildContext context, int index) {
    final todo = todoList[index];

    return CheckboxListTile(
      value: todo.isDone,
      onChanged: (bool isChecked) {
        onTodoToggle(todo, isChecked);
      },
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

import 'package:flutter/material.dart';
import 'package:flutter_todos_app/todo_entity.dart';
import 'package:flutter_todos_app/todo_list.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoEntity> todoList = [
    TodoEntity(title : 'Create test scenarios')
  ];

  _onTodoToggle(TodoEntity todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: TodoList(
        todoList: todoList,
        onTodoToggle: _onTodoToggle
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add todo',
      ),
    );
  }
}

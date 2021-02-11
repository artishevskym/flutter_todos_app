import 'package:flutter/material.dart';
import 'package:flutter_todos_app/add_todo_dialog.dart';
import 'package:flutter_todos_app/todo_entity.dart';
import 'package:flutter_todos_app/todo_list.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoEntity> todoList = [];

  _onTodoToggle(TodoEntity todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addTodo() async {
    final todo = await showDialog<TodoEntity>(
      context: context,
      builder: (BuildContext context) {
        return AddTodoDialog();
      },
    );

    if (todo != null) {
      setState(() {
        todoList.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: TodoList(
        todoList: todoList.where((element) => !element.isDone).toList(),
        onTodoToggle: _onTodoToggle
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add todo',
        onPressed: _addTodo,
      ),
    );
  }
}

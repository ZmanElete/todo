import 'package:flutter/cupertino.dart';
import '../models/todo.dart';

class TodoCard extends StatefulWidget{
  final Todo todo;

  TodoCard({
    Key key,
    this.todo,
    }): super(key: key);

  @override
  _AddTodoCardState createState() => _AddTodoCardState();
}

class _AddTodoCardState extends State<TodoCard>{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
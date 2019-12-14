import 'package:flutter/material.dart';

import '../managers/todo_manager.dart';
import '../models/status.dart';
import '../models/todo.dart';
import '../service_locator.dart';

class AddPage extends StatefulWidget {
  final Todo todo;

  AddPage({
    Key key, 
    this.todo
  }):super (key: key);

  @override
  _AddAddState createState() => _AddAddState();
}

class _AddAddState extends State<AddPage> {
  List<Todo> todos = sl.get<TodoManager>().todos;

  @override
  Widget build(BuildContext context) {
    Todo todo = widget.todo != null ? widget.todo : Todo();
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Title",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Descriptions"
          ),
        ),
        DropdownButton<StatusType>(
          items: StatusType.values.map((StatusType statusType){
            return DropdownMenuItem<StatusType>(
              value: statusType,
              child: Text(statusType.toString()),
            );
          }),
        ),
      ],
    );
  }
}
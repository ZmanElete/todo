import 'package:flutter/material.dart';

import '../managers/todo_manager.dart';
import '../models/status.dart';
import '../models/todo.dart';
import '../service_locator.dart';

class AddPage extends StatefulWidget {
  final Todo todo;

  AddPage({Key key, this.todo}) : super(key: key);

  @override
  _AddAddState createState() => _AddAddState();
}

class _AddAddState extends State<AddPage> {
  final formKey = GlobalKey<FormState>();
  List<Todo> todos = sl.get<TodoManager>().todos;
  Status status = Status.todo();

  @override
  Widget build(BuildContext context) {
    Todo todo = widget.todo != null ? widget.todo : Todo();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Card(
        color: status.color,
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
                readOnly: false,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Descriptions"),
                readOnly: false,
              ),
              DropdownButtonFormField(
                value: status.statusType.toString(),
                items: StatusType.values.map((StatusType statusType) {
                  return DropdownMenuItem<StatusType>(
                    value: statusType,
                    child: Text(statusType.toString()),
                  );
                }).toList(),
                onChanged: (newStatus) {
                  status = Status(status: newStatus);
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

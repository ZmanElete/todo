import 'package:flutter/material.dart';
import 'package:todo/widgets/app_page.dart';

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
  List<Todo> todos = sl.get<TodoManager>().todos;
  Status status = Status.todo();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      poppable: true,
      customActions: _buildCustomActions(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Card(
          color: status.color,
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Descriptions"),
                controller: descriptionController,
              ),
              _buildDropDownButton(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCustomActions(){
    return <Widget>[
      GestureDetector(
        onTap: _saveTodo,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.check,
            size: 30,
          )
        )
      ),
      GestureDetector(
        onTap: _deleteTodo,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.close,
            size: 30,
          )
        )
      ),
    ];
  }

  void _saveTodo(){
    Todo todo = _getTodo();
    if(widget.todo != null){
      widget.todo.status = todo.status;
      widget.todo.title = todo.title;
      widget.todo.description = todo.description;
    }
    else{
      todos.add(todo);
    }
    Navigator.pop(context);
  }

  void _deleteTodo(){
    Todo todo = _getTodo();
    if(todos.contains(todo)){
      todos.remove(todo);
    }
    Navigator.pop(context);
  }

  Todo _getTodo(){
    String title = titleController.text;
    String description = descriptionController.text;
    return Todo(status:status, title:title, description: description);
  }

  Widget _buildDropDownButton() {
    return DropdownButton(
      value: status.statusType,
      items: StatusType.values.map((StatusType statusType) {
        return DropdownMenuItem<StatusType>(
          value: statusType,
          child: Text(statusType.toString().split('.')[1].replaceAll('_', ' ')),
        );
      }).toList(),
      onChanged: (newStatus) {
        setState(() {
          status = Status(status: newStatus);
        });
      },
    );
  }
}

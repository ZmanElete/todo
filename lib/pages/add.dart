import 'package:flutter/material.dart';

import '../managers/todo_manager.dart';
import '../models/status.dart';
import '../models/todo.dart';
import '../service_locator.dart';
import '../widgets/app_page.dart';

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
        padding: EdgeInsets.all(25),
        height: 400,
        child: Card(
          color: status.color,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        controller: titleController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(170, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Spacer(flex: 1),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: _buildDropDownButton(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Descriptions",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(170, 255, 255, 255),
                    ),
                  ),
                  minLines: 12,
                  maxLines: 12,
                  controller: descriptionController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCustomActions() {
    return <Widget>[
      GestureDetector(
        onTap: _saveTodo,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.check,
            size: 30,
          ),
        ),
      ),
      SizedBox(height: 5, width: 5),
      GestureDetector(
          onTap: _deleteTodo,
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.close,
                size: 30,
              ))),
      SizedBox(height: 5, width: 5),
    ];
  }

  void _saveTodo() {
    Todo todo = _getTodo();
    if (widget.todo != null) {
      widget.todo.status = todo.status;
      widget.todo.title = todo.title;
      widget.todo.description = todo.description;
    } else {
      todos.add(todo);
    }
    sl.get<TodoManager>().todos = todos;
    Navigator.pop(context);
  }

  void _deleteTodo() {
    Todo todo = _getTodo();
    if (todos.contains(todo)) {
      todos.remove(todo);
    }
    sl.get<TodoManager>().todos = todos;
    Navigator.pop(context);
  }

  Todo _getTodo() {
    String title = titleController.text;
    String description = descriptionController.text;
    return Todo(status: status, title: title, description: description);
  }

  Widget _buildDropDownButton() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Theme(
          data: ThemeData(canvasColor: status.color),
          child: DropdownButton(
            value: status.status,
            items: StatusType.values.map((StatusType statusType) {
              return DropdownMenuItem<StatusType>(
                value: statusType,
                child: Text(
                  statusType.toString().split('.')[1].replaceAll('_', ' '),
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (newStatus) {
              setState(() {
                status = Status(status: newStatus);
              });
            },
          ),
        ));
  }
}

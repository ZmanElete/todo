import 'package:flutter/material.dart';
import 'package:todo/managers/todo_manager.dart';
import 'package:todo/models/todo.dart';

import '../service_locator.dart';
import '../services/hive_service.dart';
import '../widgets/card.dart';
import '../widgets/app_page.dart';

class OrganizationPage extends StatefulWidget {
  @override
  _AddOrganizationState createState() => _AddOrganizationState();
}

class _AddOrganizationState extends State<OrganizationPage> {
  List<Todo> todos = sl.get<TodoManager>().todos;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AppPage(
      poppable: true,
      customActions: _buildCustomActions(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ..._getCards(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCustomActions(){
    return[
      GestureDetector(
        onTap: _addTodo,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.add,
            size: 30,
          )
        )
      )
    ];
  }

  void _addTodo() async {
    await Navigator.pushNamed(context, 'Add') ;
    // setState((){});
  }

  List<Widget> _getCards() {
    List<Widget> todoCards = todos.map((todo) => TodoCard(todo: todo)).toList();
    return todoCards;
  }
}

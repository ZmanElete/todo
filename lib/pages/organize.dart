import 'package:flutter/material.dart';

import '../service_locator.dart';
import '../widgets/card.dart';
import '../widgets/app_page.dart';
import '../managers/todo_manager.dart';
import '../models/todo.dart';

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
        padding: EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
          children: _getCards(),
        ),
      ),
    );
  }

  List<Widget> _buildCustomActions() {
    return [
      GestureDetector(
        onTap: _addTodo,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    ];
  }

  void _addTodo() async {
    await Navigator.pushNamed(context, 'Add');
    todos = sl.get<TodoManager>().todos; //updates db
    setState(() {});
  }

  List<Widget> _getCards() {
    List<Widget> todoCards = todos
        .map((todo) => TodoCard(
              todo: todo,
              minifiable: true,
            ))
        .toList();
    return todoCards;
  }
}

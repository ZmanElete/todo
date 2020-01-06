import 'package:flutter/material.dart';
import 'package:todo/theme/theme.dart';

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
  int dragIndex = null;

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
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        alignment: Alignment.center,
        child: ListView(
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
    List<Widget> todoCards = List<Widget>();
    todos.asMap().map((i, todo) => _mapFunction(i, todo, todoCards));
    return todoCards;
  }

  MapEntry<int, Todo> _mapFunction(int i, Todo todo, List<Widget> todoCards) {
    todoCards.addAll(_buildCard(todo, i));
    return MapEntry(i, todo);
  }

  List<Widget> _buildCard(Todo todo, int i) {
    Widget card = TodoCard(
      todo: todo,
      minifiable: true,
      onChange: () {
        todos = sl.get<TodoManager>().todos;
        setState(() {});
      },
    );
    return <Widget>[
      LongPressDraggable<Todo>(
        child: card,
        feedback: Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 71,
          child: card,
        ),
        axis: Axis.vertical,
        data: todo,
        childWhenDragging: Container(
          margin: EdgeInsets.all(4),
          height: 71,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppTheme.theme.dividerColor,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      DragTarget<Todo>(
        builder: _buildDragTarget,
        onWillAccept: (Todo todo) {
          setState(() {
            dragIndex = i;
          });
          return true;
        },
        onAccept: (Todo todo) {
          _onAcceptDragTarget(todo, i);
        },
        onLeave: (Todo todo) {
          dragIndex = null;
          setState(() {});
        },
      ),
    ];
  }

  Widget _buildDragTarget(
    BuildContext contenxt,
    List<Todo> todo,
    List<dynamic> something,
  ) {
    return dragIndex != null
        ? Divider(
            color: AppTheme.theme.dividerColor,
            height: 5,
            indent: 10,
            endIndent: 10,
            thickness: 2,
          )
        : Container(
            height: 5,
          );
  }

  void _onAcceptDragTarget(Todo dragged, int i) {
    setState(() {
      todos.insert(i, dragged);
      sl.get<TodoManager>().todos = todos;
      dragIndex = null;
    });
  }
}

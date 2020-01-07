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
  int dragIndex;

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
    print("length = " + todos.length.toString());
    for (int i = 0; i < todos.length; ++i) {
      print("i = " + i.toString());
      todoCards.add(_buildDragTarget(
        i,
        (context, todos, rejected) => _dragTargetBuilder(context, todos, rejected, i),
      ));
    }
    todoCards.add(_buildDragTarget(
      todos.length,
      (context, todos, rejected) => _endDragTargetBuilder(context, todos, rejected, todos.length),
    ));
    return todoCards;
  }

  Widget _endDragTargetBuilder(
    BuildContext context,
    List<Todo> todos,
    List<dynamic> something,
    int i,
  ){
    return Container(
      height: 100,
    );
  }

  Widget _buildDragTarget(int i, Widget Function(BuildContext, List<Todo>, List<dynamic>) builder) {
    return DragTarget<Todo>(
      builder: builder,
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
    );
  }

  Widget _dragTargetBuilder(
    BuildContext context,
    List<Todo> todos,
    List<dynamic> something,
    int i,
  ) {
    Widget card = TodoCard(
      todo: this.todos[i],
      minifiable: true,
      onChange: () {
        todos = sl.get<TodoManager>().todos;
        setState(() {});
      },
    );
    return Column(
      children: <Widget>[
        dragIndex == i
            ? Divider(
                color: AppTheme.theme.dividerColor,
                height: 5,
                indent: 0,
                endIndent: 0,
                thickness: 4,
              )
            : Container(
                height: 5,
              ),
        LongPressDraggable<Todo>(
          child: card,
          feedback: Container(
            width: MediaQuery.of(context).size.width - 50,
            height: 71,
            child: card,
          ),
          axis: Axis.vertical,
          data: this.todos[i],
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
      ],
    );
  }

  void _onAcceptDragTarget(Todo dragged, int i) {
    setState(() {
      todos.removeWhere((todo) => dragged == todo);
      todos.insert(i, dragged);
      sl.get<TodoManager>().todos = todos;
      dragIndex = null;
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;
  final bool minifiable;

  TodoCard({
    Key key,
    @required this.todo,
    this.minifiable,
  }) : super(key: key);

  @override
  _AddTodoCardState createState() => _AddTodoCardState();
}

class _AddTodoCardState extends State<TodoCard> {
  bool mini;

  @override
  Widget build(BuildContext context) {
    if (mini == null) mini = widget.minifiable ?? false;
    return Container(
      height: mini ?? false ? 70 : 200,
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        color: widget.todo.status.color,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: _buildContent(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildContent() {
    return [
      Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.todo.title,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              widget.todo.status.toReadableString(),
              style: TextStyle(fontSize: 18),
            ),
          ),
          widget.minifiable
              ? GestureDetector(
                  onTap: _dropButton,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: mini
                        ? Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.arrow_drop_up,
                            color: Colors.white,
                          ),
                  ),
                )
              : Container(),
        ],
      ),
      mini
          ? Container()
          : Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  widget.todo.description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
    ];
  }

  void _dropButton() {
    mini = !mini;
    setState((){});
  }
}

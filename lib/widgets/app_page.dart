import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  final bool poppable;
  final bool hideActionMenuItems;
  final List<Widget> customActions;
  final Widget body;

  AppPage({
    Key key,
    @required this.poppable,
    this.hideActionMenuItems,
    this.customActions,
    this.body,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context), 
      body: widget.body
    );
  }

  Widget _appBar(context) {
    return AppBar(
      centerTitle: true,
      title: Text("Todo App"),
      leading: widget.poppable
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
      actions: <Widget>[
        if (widget.customActions != null) ...widget.customActions,
      ],
    );
  }
}

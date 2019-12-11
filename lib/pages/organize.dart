import 'package:flutter/material.dart';

import '../service_locator.dart';
import '../services/hive_service.dart';
import '../widgets/card.dart';
import '../widgets/app_page.dart';

class OrganizationPage extends StatefulWidget{
  @override
  _AddOrganizationState createState() => _AddOrganizationState();
}

class _AddOrganizationState extends State<OrganizationPage>{
  @override
  Widget build(BuildContext context) {
    return AppPage(
      poppable: true,
      body:Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ..._getCards(),
          ],
        ),
      ),
    );
  }

  List<Widget> _getCards(){
    var todos = sl.get<HiveService>().todos.get('todos');
    return todos.map((todo) => TodoCard(todo:todo,),).toList();
  }
}
import 'package:todo/services/hive_service.dart';

import '../models/todo.dart';

class TodoManager{
  List<Todo> _todos;
  HiveService _hiveService;

  TodoManager({List<Todo> todos, HiveService hiveService}){
    _todos = todos;
    _hiveService = hiveService;
  }

  set todos(List<Todo> todos){
    _todos = todos;
    _hiveService.todos.delete('todos');//Not sure if this is needed. But its here.
    _hiveService.todos.put('todos', _todos);
  }
  
  List<Todo> get todos{
    List<Todo> todos = List<Todo>();
    for(Todo todo in _todos){
      todos.add(todo.clone());
    }
    return todos;
  }

}
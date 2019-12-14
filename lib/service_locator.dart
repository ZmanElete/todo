import 'package:get_it/get_it.dart';

import 'models/todo.dart';
import 'services/hive_service.dart';
import 'managers/todo_manager.dart';


GetIt sl = GetIt.I;

Future<void> registerServices() async {
  var hiveService = HiveService();
  hiveService.init();
  sl.registerSingleton(hiveService);
  var todos = List<Todo>.from(hiveService.todos?.get('todos'));
  if(todos != null) sl.registerSingleton(TodoManager(todos: todos));
}
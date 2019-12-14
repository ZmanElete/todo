import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/status.dart';
import '../models/todo.dart';

class HiveService {
  Box todos;

  Future<void> init() async{
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(TodoAdapter(), 1);
    Hive.registerAdapter(StatusAdapter(), 2);
    todos = await Hive.openBox('todos');
  }
}
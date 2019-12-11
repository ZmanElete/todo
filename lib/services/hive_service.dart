import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/todo.dart';

class HiveService {
  Box todos;

  Future<void> init() async{
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Hive.registerAdapter(TodoAdapter(), 1);
    todos = await Hive.openBox('todos');
  }
}
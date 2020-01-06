import 'package:hive/hive.dart';
import 'status.dart';

//Generate Adapter run:
//flutter packages pub run build_runner build
part "todo.g.dart";

@HiveType()
class Todo extends HiveObject{
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  Status status;

  Todo({Status status, String title: '', String description: ''}){
    this.status = status ??= Status.todo();
    this.title = title;
    this.description = description;
  }

  Todo clone(){
    return Todo()
      ..title       = this.title
      ..description = this.description
      ..status      = this.status;
  }
}
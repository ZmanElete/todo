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

  @HiveField(3)
  String type;

  Todo clone(){
    return Todo()
      ..title       = this.title
      ..description = this.description
      ..status      = this.status
      ..type        = this.type;
  }
}
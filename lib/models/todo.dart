import 'package:hive/hive.dart';

part "todo.g.dart";

@HiveType()
class Todo extends HiveObject{
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String status;

  @HiveField(3)
  String type;  
}
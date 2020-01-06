import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//Generate Adapter run:
//flutter packages pub run build_runner build
part 'status.g.dart';

@HiveType()
enum StatusType {
  @HiveField(0)
  Todo,
  @HiveField(1)
  Done,
  @HiveField(2)
  Reminder,
  @HiveField(3)
  On_Hold,
  @HiveField(4)
  Doing,
}

@HiveType()
class Status {
  @HiveField(0)
  @required StatusType status;

  // Status();
  Status({StatusType status,}) {
    status = status;
  }
  Status.string({@required String statusString}){
    status = StatusType.values.firstWhere((x) => (x.toString() == statusString));
  }
  Status.done() {
    status = StatusType.Done;
  }
  Status.todo() {
    status = StatusType.Todo;
  }
  Status.reminder() {
    status = StatusType.Reminder;
  }
  Status.onHold() {
    status = StatusType.On_Hold;
  }
  Status.doing() {
    status = StatusType.Doing;
  }

  String toReadableString(){
    return status.toString().split('.')[1].replaceAll('_', ' ');
  }

  Color get color{
    switch (status) {
      case StatusType.Done:
        return Colors.green;
        break;
      case StatusType.Todo:
        return Colors.deepPurpleAccent[100];
        break;
      case StatusType.Reminder: 
        return Colors.teal;
        break;
      case StatusType.On_Hold:
        return Colors.orangeAccent[200];
        break;
      case StatusType.Doing:
        return Colors.blueAccent[200];
        break;
      default:
        return Colors.redAccent[200];
        break;
    }
  }
}

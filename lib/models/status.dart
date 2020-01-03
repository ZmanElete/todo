import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//Generate Adapter run:
//flutter packages pub run build_runner build
part 'status.g.dart';

enum StatusType {
  Todo,
  Done,
  Reminder,
  On_Hold,
  Doing,
}

@HiveType()
class Status {
  @HiveField(0)
  StatusType _status;
  @HiveField(1)
  Color _color;

  Status({StatusType status, String statusString}) {
    if (status != null) _status = status;
    else if (statusString != null) {
      _status = StatusType.values.firstWhere((x) => (x.toString() == statusString));
    }
    _setColor();
  }
  Status.done() {
    _status = StatusType.Done;
    _setColor();
  }
  Status.todo() {
    _status = StatusType.Todo;
    _setColor();
  }
  Status.reminder() {
    _status = StatusType.Reminder;
    _setColor();
  }
  Status.onHold() {
    _status = StatusType.On_Hold;
    _setColor();
  }
  Status.doing() {
    _status = StatusType.Doing;
    _setColor();
  }

  Color get color {
    return _color;
  }

  StatusType get statusType {
    return _status;
  }

  set statusType(StatusType status) {
    _status = status;
    _setColor();
  }

  void _setColor() {
    switch (_status) {
      case StatusType.Done:
        _color = Colors.greenAccent[200];
        break;
      case StatusType.Todo:
        _color = Colors.grey[300];
        break;
      case StatusType.Reminder: 
        _color = Colors.yellowAccent[100];
        break;
      case StatusType.On_Hold:
        _color = Colors.orangeAccent[200];
        break;
      case StatusType.Doing:
        _color = Colors.blueAccent[200];
        break;
      default:
        _color = Colors.redAccent[200];
        break;
    }
  }
}

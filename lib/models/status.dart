import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

//Generate Adapter run:
//flutter packages pub run build_runner build
part 'status.g.dart';

enum StatusType {
  done,
  todo,
  reminder,
  onHold,
  doing,
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
    _status = StatusType.done;
    _setColor();
  }
  Status.todo() {
    _status = StatusType.todo;
    _setColor();
  }
  Status.reminder() {
    _status = StatusType.reminder;
    _setColor();
  }
  Status.onHold() {
    _status = StatusType.onHold;
    _setColor();
  }
  Status.doing() {
    _status = StatusType.doing;
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
      case StatusType.done:
        _color = Colors.white;
        break;
      case StatusType.todo:
        _color = Colors.purpleAccent[200];
        break;
      case StatusType.reminder:
        _color = Colors.blueAccent[250];
        break;
      case StatusType.onHold:
        _color = Colors.yellowAccent[200];
        break;
      case StatusType.doing:
        _color = Colors.greenAccent[200];
        break;
      default:
        _color = Colors.redAccent[200];
        break;
    }
  }
}

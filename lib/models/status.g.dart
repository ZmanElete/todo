// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusTypeAdapter extends TypeAdapter<StatusType> {
  @override
  StatusType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StatusType.Todo;
      case 1:
        return StatusType.Done;
      case 2:
        return StatusType.Reminder;
      case 3:
        return StatusType.On_Hold;
      case 4:
        return StatusType.Doing;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, StatusType obj) {
    switch (obj) {
      case StatusType.Todo:
        writer.writeByte(0);
        break;
      case StatusType.Done:
        writer.writeByte(1);
        break;
      case StatusType.Reminder:
        writer.writeByte(2);
        break;
      case StatusType.On_Hold:
        writer.writeByte(3);
        break;
      case StatusType.Doing:
        writer.writeByte(4);
        break;
    }
  }
}

class StatusAdapter extends TypeAdapter<Status> {
  @override
  Status read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Status()..status = fields[0] as StatusType;
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.status);
  }
}

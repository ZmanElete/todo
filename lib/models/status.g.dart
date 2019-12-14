// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusAdapter extends TypeAdapter<Status> {
  @override
  Status read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Status()
      .._status = fields[0] as StatusType
      .._color = fields[1] as dynamic;
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._status)
      ..writeByte(1)
      ..write(obj._color);
  }
}

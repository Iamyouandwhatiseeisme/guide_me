// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_hours.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OpeningHoursAdapter extends TypeAdapter<OpeningHours> {
  @override
  final int typeId = 1;

  @override
  OpeningHours read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OpeningHours(
      openNow: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, OpeningHours obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.openNow);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OpeningHoursAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

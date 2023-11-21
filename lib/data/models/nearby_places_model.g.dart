// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_places_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NearbyPlacesModelAdapter extends TypeAdapter<NearbyPlacesModel> {
  @override
  final int typeId = 0;

  @override
  NearbyPlacesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NearbyPlacesModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      openingHours: fields[2] as OpeningHours?,
      photos: (fields[3] as List?)?.cast<dynamic>(),
      rating: fields[4] as num?,
      types: (fields[5] as List).cast<dynamic>(),
      openNow: fields[6] as bool?,
      userRatingsTotal: fields[7] as int?,
      vicinity: fields[8] as String?,
      lat: fields[9] as double?,
      lng: fields[10] as double?,
      placeId: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NearbyPlacesModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.openingHours)
      ..writeByte(3)
      ..write(obj.photos)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.types)
      ..writeByte(6)
      ..write(obj.openNow)
      ..writeByte(7)
      ..write(obj.userRatingsTotal)
      ..writeByte(8)
      ..write(obj.vicinity)
      ..writeByte(9)
      ..write(obj.lat)
      ..writeByte(10)
      ..write(obj.lng)
      ..writeByte(11)
      ..write(obj.placeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NearbyPlacesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

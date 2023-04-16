// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_fact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatFactAdapter extends TypeAdapter<CatFact> {
  @override
  final int typeId = 0;

  @override
  CatFact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatFact(
      fact: fields[0] as String,
    )..createdAt = fields[1] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, CatFact obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.fact)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatFactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatFact _$CatFactFromJson(Map<String, dynamic> json) => CatFact(
      fact: json['fact'] as String,
    )..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$CatFactToJson(CatFact instance) => <String, dynamic>{
      'fact': instance.fact,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

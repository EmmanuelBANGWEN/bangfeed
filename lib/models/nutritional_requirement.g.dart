// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritional_requirement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutritionalRequirementAdapter
    extends TypeAdapter<NutritionalRequirement> {
  @override
  final int typeId = 3;

  @override
  NutritionalRequirement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NutritionalRequirement(
      animal: fields[0] as String,
      stage: fields[1] as String,
      protein: fields[2] as double,
      energy: fields[3] as double,
      calcium: fields[4] as double,
      phosphore: fields[5] as double,
      lysine: fields[6] as double,
      methionine: fields[7] as double,
      fiber: fields[8] as double,
      fat: fields[9] as double,
    );
  }

  @override
  void write(BinaryWriter writer, NutritionalRequirement obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.animal)
      ..writeByte(1)
      ..write(obj.stage)
      ..writeByte(2)
      ..write(obj.protein)
      ..writeByte(3)
      ..write(obj.energy)
      ..writeByte(4)
      ..write(obj.calcium)
      ..writeByte(5)
      ..write(obj.phosphore)
      ..writeByte(6)
      ..write(obj.lysine)
      ..writeByte(7)
      ..write(obj.methionine)
      ..writeByte(8)
      ..write(obj.fiber)
      ..writeByte(9)
      ..write(obj.fat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutritionalRequirementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

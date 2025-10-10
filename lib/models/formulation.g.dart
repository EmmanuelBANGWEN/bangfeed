// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formulation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormulationAdapter extends TypeAdapter<Formulation> {
  @override
  final int typeId = 1;

  @override
  Formulation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Formulation(
      userId: fields[0] as String,
      animalType: fields[1] as String,
      growthStage: fields[2] as String,
      ingredients: (fields[3] as List).cast<Ingredient>(),
      totalCost: fields[4] as double,
      date: fields[5] as DateTime,
      isSynced: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Formulation obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.animalType)
      ..writeByte(2)
      ..write(obj.growthStage)
      ..writeByte(3)
      ..write(obj.ingredients)
      ..writeByte(4)
      ..write(obj.totalCost)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.isSynced);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormulationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_formula.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedFormulaAdapter extends TypeAdapter<FeedFormula> {
  @override
  final int typeId = 2;

  @override
  FeedFormula read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedFormula(
      animal: fields[0] as String,
      stage: fields[1] as String,
      ingredients: (fields[2] as List).cast<Ingredient>(),
      totalProtein: fields[3] as double,
      totalEnergy: fields[4] as double,
      totalCalcium: fields[5] as double,
      totalPhosphore: fields[6] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FeedFormula obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.animal)
      ..writeByte(1)
      ..write(obj.stage)
      ..writeByte(2)
      ..write(obj.ingredients)
      ..writeByte(3)
      ..write(obj.totalProtein)
      ..writeByte(4)
      ..write(obj.totalEnergy)
      ..writeByte(5)
      ..write(obj.totalCalcium)
      ..writeByte(6)
      ..write(obj.totalPhosphore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedFormulaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

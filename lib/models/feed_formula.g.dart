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
      totalLysine: fields[7] as double,
      totalMethionine: fields[8] as double,
      totalFiber: fields[9] as double,
      totalFat: fields[10] as double,
    );
  }

  @override
  void write(BinaryWriter writer, FeedFormula obj) {
    writer
      ..writeByte(11)
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
      ..write(obj.totalPhosphore)
      ..writeByte(7)
      ..write(obj.totalLysine)
      ..writeByte(8)
      ..write(obj.totalMethionine)
      ..writeByte(9)
      ..write(obj.totalFiber)
      ..writeByte(10)
      ..write(obj.totalFat);
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 0;

  @override
  Ingredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(
      name: fields[0] as String,
      protein: fields[1] as double,
      energy: fields[2] as double,
      price: fields[3] as double,
      quantity: fields[4] as double?,
      calcium: fields[5] as double?,
      phosphore: fields[6] as double?,
      minIncl: fields[7] as double?,
      maxIncl: fields[8] as double?,
      lysine: fields[9] as double?,
      methionine: fields[10] as double?,
      fiber: fields[11] as double?,
      fat: fields[12] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.protein)
      ..writeByte(2)
      ..write(obj.energy)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.calcium)
      ..writeByte(6)
      ..write(obj.phosphore)
      ..writeByte(7)
      ..write(obj.minIncl)
      ..writeByte(8)
      ..write(obj.maxIncl)
      ..writeByte(9)
      ..write(obj.lysine)
      ..writeByte(10)
      ..write(obj.methionine)
      ..writeByte(11)
      ..write(obj.fiber)
      ..writeByte(12)
      ..write(obj.fat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

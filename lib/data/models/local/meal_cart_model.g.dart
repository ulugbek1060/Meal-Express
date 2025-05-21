// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealCartModelAdapter extends TypeAdapter<MealCartModel> {
  @override
  final int typeId = 1;

  @override
  MealCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealCartModel(
      mealId: fields[0] as String,
      name: fields[1] as String,
      thumb: fields[2] as String,
      price: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MealCartModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.mealId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.thumb)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

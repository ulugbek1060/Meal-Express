import 'package:hive/hive.dart';

part 'meal_cart_model.g.dart';

@HiveType(typeId: 1)
class MealCartModel extends HiveObject {
  @HiveField(0)
  final String mealId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String thumb;

  @HiveField(3)
  final double price;

  MealCartModel({
    required this.mealId,
    required this.name,
    required this.thumb,
    required this.price,
  });
}

import 'meal_cart_model.dart';

import 'package:hive/hive.dart';

part 'cart_item_model.g.dart';

@HiveType(typeId: 2)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final MealCartModel meal;

  @HiveField(1)
  int quantity;

  CartItemModel({
    required this.meal,
    this.quantity = 1,
  });

  double get totalPrice => meal.price * quantity;
}

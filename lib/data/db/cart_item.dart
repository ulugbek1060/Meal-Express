import 'package:hive/hive.dart';
import 'package:meal_express/data/sources/models/meal_detail_data.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final MealDetail meal;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  final DateTime addedAt;

  CartItem({
    required this.meal,
    this.quantity = 1,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  int get totalPrice => meal.price * quantity;

  CartItem copyWith({
    MealDetail? meal,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      meal: meal ?? this.meal,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
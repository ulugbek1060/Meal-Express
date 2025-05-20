import 'package:hive/hive.dart';
import 'package:meal_express/data/sources/models/meal_detail_data.dart';

import 'cart_item.dart';

class CartDatabase {
  static const _boxName = 'cart_items';

  Future<Box<CartItem>> get _box async => await Hive.openBox<CartItem>(_boxName);

  Future<void> addItem(MealDetail meal, {int quantity = 1}) async {
    final box = await _box;
    final existing = await _findItem(meal.idMeal!);

    if (existing != null) {
      await box.put(
        existing.key,
        existing.item.copyWith(quantity: existing.item.quantity + quantity),
      );
    } else {
      await box.add(CartItem(meal: meal, quantity: quantity));
    }
  }

  Future<List<CartItem>> getAllItems() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> updateItem(String mealId, int newQuantity) async {
    final existing = await _findItem(mealId);
    if (existing != null) {
      final box = await _box;
      await box.put(
        existing.key,
        existing.item.copyWith(quantity: newQuantity),
      );
    }
  }

  Future<void> removeItem(String mealId) async {
    final existing = await _findItem(mealId);
    if (existing != null) {
      final box = await _box;
      await box.delete(existing.key);
    }
  }

  Future<void> clearAll() async {
    final box = await _box;
    await box.clear();
  }

  Future<({int key, CartItem item})?> _findItem(String mealId) async {
    final box = await _box;
    for (var i = 0; i < box.length; i++) {
      final item = box.getAt(i);
      if (item?.meal.idMeal == mealId) {
        return (key: i, item: item!);
      }
    }
    return null;
  }

  Future<double> getTotal() async {
    final box = await _box;
    return box.values.fold<double>(0.0, (sum, item) {
      if (item.meal.price == null) {
        throw Exception('Meal price is null for item: ${item.meal.idMeal}');
      }
      return sum + (item.meal.price! * item.quantity);
    });
  }

  Future<int> getItemCount() async {
    final box = await _box;
    return box.length;
  }
}

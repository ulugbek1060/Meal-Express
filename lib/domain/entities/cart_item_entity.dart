class CartItemEntity {
  final MealCartItem meal;
  final int quantity;

  double totalPrice() => meal.price ?? 0.0 * quantity;

  CartItemEntity({required this.meal, required this.quantity});
}

class MealCartItem {
  final String? idMeal;
  final String? strMeal;
  final String? strMealThumb;
  final double? price;

  MealCartItem({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
    required this.price,
  });
}

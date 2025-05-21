import 'package:injectable/injectable.dart';
import 'package:meal_express/data/models/local/cart_item_model.dart';
import 'package:meal_express/data/models/local/meal_cart_model.dart';
import 'package:meal_express/data/sources/local/cart_local_storage.dart';
import 'package:meal_express/domain/entities/cart_item_entity.dart';
import 'package:meal_express/domain/repositories/cart_repository.dart';
import 'package:meal_express/utils/logger.dart';

@Singleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartLocalStorage storage;

  CartRepositoryImpl(this.storage);

  @override
  Future<void> addToCart(CartItemEntity item) async {
    final meal = MealCartModel(
      mealId: item.meal.idMeal ?? "",
      name: item.meal.strMeal ?? "",
      thumb: item.meal.strMealThumb ?? "",
      price: item.meal.price ?? 0.0,
    );
    await storage.addToCart(CartItemModel(meal: meal));
  }

  @override
  Future<void> clearCart() async {
    await storage.clearCart();
  }

  @override
  Stream<List<CartItemEntity>> getCartItems() {
    return storage.cartItemsStream.map((value) {
      return value.map((e) {
        final meal = MealCartItem(
          strMeal: e.meal.name,
          strMealThumb: e.meal.thumb,
          idMeal: e.meal.mealId,
          price: e.meal.price,
        );
        Logger.debug(e.meal.price);
        return CartItemEntity(meal: meal, quantity: e.quantity);
      }).toList();
    });
  }

  @override
  Future<void> removeFromCart(String mealId) async {
    await storage.removeFromCart(mealId);
  }

  @override
  Future<void> updateQuantity(String mealId, int quantity) async {
    await storage.updateQuantity(mealId, quantity);
  }
}

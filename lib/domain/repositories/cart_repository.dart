import 'package:meal_express/domain/entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<void> addToCart(CartItemEntity item);
  Future<void> removeFromCart(String mealId);
  Future<void> updateQuantity(String mealId, int quantity);
  Stream<List<CartItemEntity>> getCartItems();
  Future<void> clearCart();
}
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/domain/entities/cart_item_entity.dart';
import 'package:meal_express/domain/repositories/cart_repository.dart';
import 'package:meal_express/utils/logger.dart';

@Injectable()
class CartProvider with ChangeNotifier {
  final CartRepository _repository;

  CartProvider(this._repository) {
    _listenToCart();
  }

  List<CartItemEntity> _items = [];
  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);
  List<CartItemEntity> get items => _items;

  double get totalPrice =>
      _items.fold(0.0, (sum, item) => sum + item.totalPrice());

  void _listenToCart() {
    _repository.getCartItems().listen((cartItems) {
      _items = cartItems;
      notifyListeners();
    });
  }

  Future<void> addItem(MealCartItem meal, {int quantity = 1}) async {
    final existingItem = _items.firstWhere(
      (item) => item.meal.idMeal == meal.idMeal,
      orElse: () => CartItemEntity(meal: meal, quantity: 0),
    );
    Logger.debug(existingItem, tag: "CART_ITEM");
    final newQty = existingItem.quantity + quantity;
    final newItem = CartItemEntity(meal: meal, quantity: newQty);
    await _repository.addToCart(newItem);
  }

  Future<void> incrementQuantity(String mealId) async {
    final existingItem = _items.firstWhere(
      (item) => item.meal.idMeal == mealId,
    );
    Logger.debug(existingItem.totalPrice, tag: "TOTAL_PRICE");
    Logger.debug(items.length, tag: "TOTAL_PRICE");
    await _updateQuantity(mealId, existingItem.quantity + 1);
  }

  Future<void> decreaseQuantity(String mealId) async {
    final existingItem = _items.firstWhere(
      (item) => item.meal.idMeal == mealId,
    );
    await _updateQuantity(mealId, existingItem.quantity - 1);
  }

  Future<void> _updateQuantity(String mealId, int quantity) async {
    await _repository.updateQuantity(mealId, quantity);
  }

  Future<void> removeItem(String mealId) async {
    await _repository.removeFromCart(mealId);
  }

  Future<void> clearCart() async {
    await _repository.clearCart();
  }
}

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/local/cart_item_model.dart';

@singleton
class CartLocalStorage {
  final Box<CartItemModel> cartBox;
  final BehaviorSubject<List<CartItemModel>> _cartStream;

  CartLocalStorage(this.cartBox)
      : _cartStream = BehaviorSubject<List<CartItemModel>>.seeded([]) {
    _emitCurrentCart();
    cartBox.watch().listen((_) => _emitCurrentCart());
  }

  Stream<List<CartItemModel>> get cartItemsStream => _cartStream.stream;

  Future<void> addToCart(CartItemModel item) async {
    await cartBox.put(item.meal.mealId, item);
    _emitCurrentCart();
  }

  Future<void> removeFromCart(String mealId) async {
    await cartBox.delete(mealId);
    _emitCurrentCart();
  }

  Future<void> updateQuantity(String mealId, int quantity) async {
    final item = cartBox.get(mealId);
    if (item != null) {
      item.quantity = quantity;
      if (quantity == 0) {
        return await item.delete();
      }
      await item.save();
      _emitCurrentCart();
    }
  }

  List<CartItemModel> getCurrentCartItems() {
    return cartBox.values.toList();
  }

  Future<void> clearCart() async {
    await cartBox.clear();
    _emitCurrentCart();
  }

  void _emitCurrentCart() {
    _cartStream.add(getCurrentCartItems());
  }

  void dispose() {
    _cartStream.close();
  }
}

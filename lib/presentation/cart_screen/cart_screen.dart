import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:meal_express/domain/entities/cart_item_entity.dart';
import 'package:meal_express/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Корзина"),
        centerTitle: true,
        leading: const BackButton(),
        actions: [
          InkWell(
            onTap: () {
              Provider.of<CartProvider>(context, listen: false).clearCart();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.delete_outline),
            ),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, _) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final item = cart.items[index];
                    return _CartItem(item: item);
                  },
                  childCount: cart.items.length,
                ),
              ),
              SliverToBoxAdapter(
                child: _BottomSliverBox(
                  totalItems: cart.totalItems,
                  totalPrice: cart.totalPrice,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final CartItemEntity item;

  const _CartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: item.meal.strMealThumb ?? "",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.fastfood),
            ),
          ),
          const SizedBox(width: 12),

          // texts and controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.meal.strMeal ?? "name of meal",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  "${item.meal.price} sum",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).decreaseQuantity(item.meal.idMeal ?? "");
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(item.quantity.toString(),
                        style: const TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).incrementQuantity(item.meal.idMeal ?? "");
                      },
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSliverBox extends StatelessWidget {
  final int totalItems;
  final double totalPrice;

  const _BottomSliverBox({
    super.key,
    required this.totalPrice,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Divider(),
          _SummaryContainer(
            label: "Meal, $totalItems",
            value: "$totalPrice sum",
          ),
          const Divider(),
          const _SummaryContainer(label: "Discount", value: "0 sum"),
          _SummaryContainer(
            label: "Total to pay",
            value: "$totalPrice sum",
            bold: true,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class _SummaryContainer extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const _SummaryContainer({
    super.key,
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: textStyle),
          Text(value, style: textStyle),
        ],
      ),
    );
  }
}

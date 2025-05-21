import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_express/config/di.dart';
import 'package:meal_express/domain/entities/cart_item_entity.dart';
import 'package:meal_express/domain/entities/meal_detail_entity.dart';
import 'package:meal_express/presentation/meals_screen/providers/meal_detail_provider.dart';
import 'package:meal_express/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MealDetailView extends StatefulWidget {
  final String mealId;

  const MealDetailView({super.key, required this.mealId});

  @override
  State<MealDetailView> createState() => _MealDetailViewState();
}

class _MealDetailViewState extends State<MealDetailView> {
  final provider = locator.get<MealDetailProvider>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => provider..loadMealByID(widget.mealId),
      child: Consumer<MealDetailProvider>(
        builder: (context, provider, _) {
          final meal = provider.meadDetail;
          final isLoading = provider.isLoading;
          final error = provider.error;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (error != null) {
            return Center(child: Text('Error: $error'));
          }

          if (meal == null) {
            return const Center(child: Text('Meal not found'));
          }

          return _buildBottomSheetContent(context, meal);
        },
      ),
    );
  }

  Widget _buildBottomSheetContent(BuildContext context, MealDetailEntity meal) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl: meal.strMealThumb ?? '',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget:
                      (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.fastfood, size: 50),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.strMeal ?? 'No name available',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (meal.strCategory != null)
                          _buildDetailChip(meal.strCategory!),
                        if (meal.strArea != null) ...[
                          const SizedBox(width: 8),
                          _buildDetailChip(meal.strArea!),
                        ],
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (meal.strInstructions != null)
                      Text(
                        meal.strInstructions!,
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(
                      MealCartItem(
                        strMeal: meal.strMeal,
                        strMealThumb: meal.strMealThumb,
                        idMeal: meal.idMeal,
                        price: meal.price,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailChip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.grey[100],
      labelStyle: const TextStyle(fontSize: 12),
      visualDensity: VisualDensity.compact,
    );
  }
}

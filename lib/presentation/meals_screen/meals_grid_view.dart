import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_express/config/di.dart';
import 'package:meal_express/presentation/meals_screen/providers/meals_provider.dart';
import 'package:provider/provider.dart';

import 'meal_detail_view.dart' show MealDetailView;

class MealsGridView extends StatefulWidget {
  final String categoryName;

  const MealsGridView({super.key, required this.categoryName});

  @override
  State<MealsGridView> createState() => _MealsGridViewState();
}

class _MealsGridViewState extends State<MealsGridView> {
  final provider = locator.get<MealsProvider>();

  @override
  void initState() {
    super.initState();
    provider.loadMealsByCategory(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => provider,
      child: Consumer<MealsProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: provider.meals.length,
              itemBuilder: (context, index) {
                final meal = provider.meals[index];
                return MealItemCard(
                  name: meal.strMeal ?? "meal name",
                  price: 'Add to cart',
                  imageUrl: meal.strMealThumb ?? "img",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => MealDetailView(mealId: meal.idMeal ?? ""),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MealItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;
  final VoidCallback onTap;

  const MealItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Container(
                        color: Colors.grey[200],
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget:
                      (context, url, error) => const Icon(Icons.fastfood),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:() {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

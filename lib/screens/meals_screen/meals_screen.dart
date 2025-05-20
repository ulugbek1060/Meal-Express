import 'package:flutter/material.dart';
import 'package:meal_express/screens/meals_screen/providers/categories_provide.dart';
import 'package:provider/provider.dart';

import '../../config/di.dart';
import 'meals_grid_view.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen>
    with SingleTickerProviderStateMixin {
  final provider = locator<CategoryProvider>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await provider.loadCategories();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => provider,
      child: Consumer<CategoryProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text('Error: ${provider.error}'));
          }

          _tabController = TabController(
            length: provider.categories.length,
            vsync: this,
          );

          return Scaffold(
            appBar: AppBar(
              title: const Text('Меню'),
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs:
                    provider.categories
                        .map((category) => Tab(text: category))
                        .toList(),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children:
                  provider.categories
                      .map((category) => MealsGridView(categoryName: category))
                      .toList(),
            ),
          );
        },
      ),
    );
  }
}

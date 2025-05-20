
import 'models/categories_data.dart';
import 'models/meal_detail_data.dart';
import 'models/meals_data.dart';

abstract class MealSource {
  Future<CategoriesData> getMealsCategory();
  Future<MealsData> getMealsByCategory(String category);
  Future<MealDetailData> getMealById(String id);
}

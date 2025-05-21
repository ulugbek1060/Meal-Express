import 'package:injectable/injectable.dart';
import 'package:meal_express/data/sources/remote/meals_api.dart';
import 'package:meal_express/domain/entities/meal_detail_entity.dart';
import 'package:meal_express/domain/entities/meal_item_entity.dart';
import 'package:meal_express/domain/repositories/meal_repository.dart';

@Singleton(as: MealRepository)
class MealsRepositoryImpl implements MealRepository {
  final MealApi _api;

  MealsRepositoryImpl(this._api);

  @override
  Future<MealDetailEntity> getMealById(String id) async {
    final result = await _api.getMealById(id);
    if (result.meals?.isEmpty ?? true) {
      throw Exception("Meal not found!");
    }
    final meal = result.meals!.first;
    return MealDetailEntity(
      idMeal: meal?.idMeal,
      strMeal: meal?.strMeal,
      strMealAlternate: meal?.strMealAlternate,
      strCategory: meal?.strCategory,
      strArea: meal?.strArea,
      strInstructions: meal?.strInstructions,
      strMealThumb: meal?.strMealThumb,
      price: meal?.price ?? 45000,
    );
  }

  @override
  Future<List<MealItemEntity>> getMealsByCategory(String category) async {
    final result = await _api.getMealsByCategory(category);
    if (result.meals?.isEmpty ?? true) {
      throw Exception("Meal not found!");
    }
    return result.meals!.map((e) {
      return MealItemEntity(e.strMeal, e.strMealThumb, e.idMeal);
    }).toList();
  }
}

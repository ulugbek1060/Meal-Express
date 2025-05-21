import 'package:meal_express/domain/entities/meal_detail_entity.dart';
import 'package:meal_express/domain/entities/meal_item_entity.dart';

abstract class MealRepository {
  Future<List<MealItemEntity>> getMealsByCategory(String category);
  Future<MealDetailEntity> getMealById(String id);
}
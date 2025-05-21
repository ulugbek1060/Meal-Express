import 'package:meal_express/domain/entities/category_item_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryItemEntity>> getMealsCategory();
}

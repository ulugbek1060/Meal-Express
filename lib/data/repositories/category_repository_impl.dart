import 'package:injectable/injectable.dart';
import 'package:meal_express/data/sources/remote/meals_api.dart';
import 'package:meal_express/domain/entities/category_item_entity.dart';
import 'package:meal_express/domain/repositories/category_repository.dart';

@Singleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {

  final MealApi _api;
  CategoryRepositoryImpl(this._api);

  @override
  Future<List<CategoryItemEntity>> getMealsCategory() async {
    final result = await _api.getMealsCategory();
    if (result.categories?.isEmpty ?? true) {
      throw Exception("Categories not found!");
    }
    return result.categories!.map((e) {
      return CategoryItemEntity(
        e.idCategory,
        e.strCategory,
        e.strCategoryThumb,
        e.strCategoryDescription,
      );
    }).toList();
  }
}

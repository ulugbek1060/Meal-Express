import 'package:json_annotation/json_annotation.dart';

part 'meal_item_data.g.dart';

@JsonSerializable()
class MealItemData {
  final List<MealItemMealsData>? meals;

  MealItemData(this.meals);

  factory MealItemData.fromJson(Map<String, dynamic> json) =>
      _$MealItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$MealItemDataToJson(this);
}

@JsonSerializable()
class MealItemMealsData {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  MealItemMealsData(this.strMeal, this.strMealThumb, this.idMeal);

  factory MealItemMealsData.fromJson(Map<String, dynamic> json) =>
      _$MealItemMealsDataFromJson(json);

  Map<String, dynamic> toJson() => _$MealItemMealsDataToJson(this);
}

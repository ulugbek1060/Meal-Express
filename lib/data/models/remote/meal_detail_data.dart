import 'package:json_annotation/json_annotation.dart';

part 'meal_detail_data.g.dart';

@JsonSerializable()
class MealDetailData {
  final List<MealDetailMealsData?>? meals;

  MealDetailData(this.meals);

  factory MealDetailData.fromJson(Map<String, dynamic> json) =>
      _$MealDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$MealDetailDataToJson(this);
}

@JsonSerializable()
class MealDetailMealsData {
  final String? idMeal;
  final String? strMeal;
  final String? strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final double? price;

  MealDetailMealsData(
    this.idMeal,
    this.strMeal,
    this.strMealAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.price,
  );

  factory MealDetailMealsData.fromJson(Map<String, dynamic> json) =>
      _$MealDetailMealsDataFromJson(json);

  Map<String, dynamic> toJson() => _$MealDetailMealsDataToJson(this);
}

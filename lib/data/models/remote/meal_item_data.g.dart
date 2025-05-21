// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealItemData _$MealItemDataFromJson(Map<String, dynamic> json) => MealItemData(
      (json['meals'] as List<dynamic>?)
          ?.map((e) => MealItemMealsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealItemDataToJson(MealItemData instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

MealItemMealsData _$MealItemMealsDataFromJson(Map<String, dynamic> json) =>
    MealItemMealsData(
      json['strMeal'] as String?,
      json['strMealThumb'] as String?,
      json['idMeal'] as String?,
    );

Map<String, dynamic> _$MealItemMealsDataToJson(MealItemMealsData instance) =>
    <String, dynamic>{
      'strMeal': instance.strMeal,
      'strMealThumb': instance.strMealThumb,
      'idMeal': instance.idMeal,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDetailData _$MealDetailDataFromJson(Map<String, dynamic> json) =>
    MealDetailData(
      (json['meals'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MealDetailMealsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealDetailDataToJson(MealDetailData instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

MealDetailMealsData _$MealDetailMealsDataFromJson(Map<String, dynamic> json) =>
    MealDetailMealsData(
      json['idMeal'] as String?,
      json['strMeal'] as String?,
      json['strMealAlternate'] as String?,
      json['strCategory'] as String?,
      json['strArea'] as String?,
      json['strInstructions'] as String?,
      json['strMealThumb'] as String?,
      (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MealDetailMealsDataToJson(
        MealDetailMealsData instance) =>
    <String, dynamic>{
      'idMeal': instance.idMeal,
      'strMeal': instance.strMeal,
      'strMealAlternate': instance.strMealAlternate,
      'strCategory': instance.strCategory,
      'strArea': instance.strArea,
      'strInstructions': instance.strInstructions,
      'strMealThumb': instance.strMealThumb,
      'price': instance.price,
    };

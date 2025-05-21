// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesData _$CategoriesDataFromJson(Map<String, dynamic> json) =>
    CategoriesData(
      (json['categories'] as List<dynamic>?)
          ?.map((e) =>
              CategoriesCategoriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDataToJson(CategoriesData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoriesCategoriesData _$CategoriesCategoriesDataFromJson(
        Map<String, dynamic> json) =>
    CategoriesCategoriesData(
      json['idCategory'] as String?,
      json['strCategory'] as String?,
      json['strCategoryThumb'] as String?,
      json['strCategoryDescription'] as String?,
    );

Map<String, dynamic> _$CategoriesCategoriesDataToJson(
        CategoriesCategoriesData instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };

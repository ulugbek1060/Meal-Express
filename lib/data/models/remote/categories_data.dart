import 'package:json_annotation/json_annotation.dart';

part 'categories_data.g.dart';

@JsonSerializable()
class CategoriesData {
  final List<CategoriesCategoriesData>? categories;

  CategoriesData(this.categories);

  factory CategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}

@JsonSerializable()
class CategoriesCategoriesData {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  CategoriesCategoriesData(
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  );

  factory CategoriesCategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesCategoriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesCategoriesDataToJson(this);
}

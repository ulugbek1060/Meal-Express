import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/data/models/remote/meal_detail_data.dart';
import 'package:meal_express/data/models/remote/meal_item_data.dart';

import '../../../utils/constants.dart';
import '../../models/remote/categories_data.dart';

@singleton
class MealApi {
  final Dio _dio;

  MealApi(this._dio);

  Future<MealDetailData> getMealById(String id) => _makeRequest<MealDetailData>(
    endpoint: 'lookup.php',
    queryParams: {'i': id},
    fromJson: MealDetailData.fromJson,
  );

  Future<MealItemData> getMealsByCategory(String category) =>
      _makeRequest<MealItemData>(
        endpoint: 'filter.php',
        queryParams: {'c': category},
        fromJson: MealItemData.fromJson,
      );

  Future<CategoriesData> getMealsCategory() => _makeRequest<CategoriesData>(
    endpoint: 'categories.php',
    fromJson: CategoriesData.fromJson,
  );

  Future<T> _makeRequest<T>({
    required String endpoint,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      if (response.statusCode == 200) {
        return fromJson(response.data);
      }
      throw _handleError(response.statusCode);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleError(int? statusCode) {
    return Exception(Constants.apiFailure(statusCode));
  }

  Exception _handleDioError(DioException e) {
    return Exception(Constants.dioFailure(e));
  }
}
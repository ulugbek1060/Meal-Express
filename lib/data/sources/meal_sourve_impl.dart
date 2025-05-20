import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/utils/constants.dart';
import 'package:meal_express/utils/logger.dart';

import 'meal_source.dart';
import 'models/categories_data.dart';
import 'models/meal_detail_data.dart';
import 'models/meals_data.dart';

@Injectable(as: MealSource)
class MealSourceImpl implements MealSource {
  final Dio _dio;

  MealSourceImpl(this._dio);

  @override
  Future<MealDetailData> getMealById(String id) => _makeRequest<MealDetailData>(
    endpoint: 'lookup.php',
    queryParams: {'i': id},
    fromJson: MealDetailData.fromJson,
  );

  @override
  Future<MealsData> getMealsByCategory(String category) =>
      _makeRequest<MealsData>(
        endpoint: 'filter.php',
        queryParams: {'c': category},
        fromJson: MealsData.fromJson,
      );

  @override
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
        Logger.debug(response.realUri, tag: "MyResultRealUri");
        Logger.debug(response.data, tag: "MyResultData");
        return fromJson(response.data);
      }
      throw _handleError(response.statusCode);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Exception _handleError(int? statusCode) {
    Logger.error(statusCode);
    return Exception(Constants.apiFailure(statusCode));
  }

  Exception _handleDioError(DioException e) {
    Logger.error(e.message);
    return Exception(Constants.dioFailure(e));
  }
}

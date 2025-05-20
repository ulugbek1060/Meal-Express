
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/data/sources/meal_source.dart';
import 'package:meal_express/data/sources/models/meals_data.dart';
import 'package:meal_express/utils/logger.dart';

@injectable
class MealsProvider with ChangeNotifier {
  final MealSource _mealSource;

  MealsProvider(this._mealSource);

  List<MealData> _meals = [];
  List<MealData> get meals => _meals;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadMealsByCategory(String category) async {
    try {
      _isLoading = true;
      notifyListeners();

      final result  = await _mealSource.getMealsByCategory(category);
      Logger.debug(result.meals, tag: "MEals");
      _meals = result.meals ?? [];
      _error = null;
    } catch (e) {
      _error = e.toString();
      _meals = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
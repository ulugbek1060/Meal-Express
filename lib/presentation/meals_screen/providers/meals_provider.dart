import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/domain/entities/meal_item_entity.dart';
import 'package:meal_express/domain/repositories/meal_repository.dart';

@injectable
class MealsProvider with ChangeNotifier {
  final MealRepository _repository;
  MealsProvider(this._repository);

  List<MealItemEntity> get meals => _meals;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<MealItemEntity> _meals = [];
  bool _isLoading = false;
  String? _error;

  Future<void> loadMealsByCategory(String category) async {
    try {
      _isLoading = true;
      notifyListeners();
      _meals  = await _repository.getMealsByCategory(category);
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
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/domain/entities/meal_detail_entity.dart';
import 'package:meal_express/domain/repositories/meal_repository.dart';

@injectable
class MealDetailProvider with ChangeNotifier {
  final MealRepository _repository;
  MealDetailProvider(this._repository);

  MealDetailEntity? get meadDetail => _meadDetail;
  String? get error => _error;
  bool get isLoading => _isLoading;

  MealDetailEntity? _meadDetail;
  bool _isLoading = true;
  String? _error;

  Future<void> loadMealByID(String mealId) async {
    try {
      _isLoading = true;
      notifyListeners();
      _meadDetail = await _repository.getMealById(mealId);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

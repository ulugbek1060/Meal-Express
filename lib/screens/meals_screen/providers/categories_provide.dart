import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/data/sources/meal_source.dart';

@injectable
class CategoryProvider with ChangeNotifier {
  final MealSource _mealSource;

  CategoryProvider(this._mealSource);

  List<String> get categories => _categories;
  String? get error => _error;
  bool get isLoading => _isLoading;


  List<String> _categories = [];
  bool _isLoading = true;
  String? _error;

  Future<void> loadCategories() async {
    try {
      _isLoading = true;
      notifyListeners();

      final result = await _mealSource.getMealsCategory();

      // esli null to empty list
      _categories =
          result.categories
              ?.map((c) => c.strCategory ?? "category-name")
              .toList() ??
          [];

      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

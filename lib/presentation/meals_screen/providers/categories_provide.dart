import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meal_express/domain/repositories/category_repository.dart';

@injectable
class CategoriesProvider with ChangeNotifier {
  final CategoryRepository _repository;

  CategoriesProvider(this._repository);

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
      final result = await _repository.getMealsCategory();
      _categories = result.map((e) => e.strCategory ?? "").toList();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

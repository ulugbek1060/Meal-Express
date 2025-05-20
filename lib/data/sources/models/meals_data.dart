/// meals : [{"strMeal":"Baked salmon with fennel & tomatoes","strMealThumb":"https://www.themealdb.com/images/media/meals/1548772327.jpg","idMeal":"52959"},null]

class MealsData {
  MealsData({
      List<MealData>? meals,}){
    _meals = meals;
}

  MealsData.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(MealData.fromJson(v));
      });
    }
  }
  List<MealData>? _meals;
MealsData copyWith({  List<MealData>? meals,
}) => MealsData(  meals: meals ?? _meals,
);
  List<MealData>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// strMeal : "Baked salmon with fennel & tomatoes"
/// strMealThumb : "https://www.themealdb.com/images/media/meals/1548772327.jpg"
/// idMeal : "52959"

class MealData {
  MealData({
      String? strMeal, 
      String? strMealThumb, 
      String? idMeal,}){
    _strMeal = strMeal;
    _strMealThumb = strMealThumb;
    _idMeal = idMeal;
}

  MealData.fromJson(dynamic json) {
    _strMeal = json['strMeal'];
    _strMealThumb = json['strMealThumb'];
    _idMeal = json['idMeal'];
  }
  String? _strMeal;
  String? _strMealThumb;
  String? _idMeal;
MealData copyWith({  String? strMeal,
  String? strMealThumb,
  String? idMeal,
}) => MealData(  strMeal: strMeal ?? _strMeal,
  strMealThumb: strMealThumb ?? _strMealThumb,
  idMeal: idMeal ?? _idMeal,
);
  String? get strMeal => _strMeal;
  String? get strMealThumb => _strMealThumb;
  String? get idMeal => _idMeal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strMeal'] = _strMeal;
    map['strMealThumb'] = _strMealThumb;
    map['idMeal'] = _idMeal;
    return map;
  }

}
/// meals : [{"idMeal":"53041","strMeal":"Grilled Portuguese sardines","strMealAlternate":null,"strCategory":"Seafood","strArea":"Portuguese","strInstructions":"STEP 1\r\n\r\nPut all of the ingredients, except the sardines, into a bowl and mix together with some seasoning. Pour into a baking dish, add the sardines and toss really well. Cover and chill for a few hours.\r\n\r\nSTEP 2\r\n\r\nHeat a BBQ or griddle pan until hot. Cook the sardines for 4-5 minutes on each side or until really caramelised and charred. Put onto a serving plate, drizzle with oil, sprinkle with a little more paprika and squeeze over the lemon wedges.","strMealThumb":"https://www.themealdb.com/images/media/meals/lpd4wy1614347943.jpg","strTags":null,"strYoutube":"https://www.youtube.com/watch?v=JYtMjKa6cdY","strIngredient1":"Sardines","strIngredient2":"Olive Oil"}]

class MealDetailData {
  MealDetailData({List<MealDetail>? meals}) {
    _meals = meals;
  }

  MealDetailData.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(MealDetail.fromJson(v));
      });
    }
  }

  List<MealDetail>? _meals;

  MealDetailData copyWith({List<MealDetail>? meals}) =>
      MealDetailData(meals: meals ?? _meals);

  List<MealDetail>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// idMeal : "53041"
/// strMeal : "Grilled Portuguese sardines"
/// strMealAlternate : null
/// strCategory : "Seafood"
/// strArea : "Portuguese"
/// strInstructions : "STEP 1\r\n\r\nPut all of the ingredients, except the sardines, into a bowl and mix together with some seasoning. Pour into a baking dish, add the sardines and toss really well. Cover and chill for a few hours.\r\n\r\nSTEP 2\r\n\r\nHeat a BBQ or griddle pan until hot. Cook the sardines for 4-5 minutes on each side or until really caramelised and charred. Put onto a serving plate, drizzle with oil, sprinkle with a little more paprika and squeeze over the lemon wedges."
/// strMealThumb : "https://www.themealdb.com/images/media/meals/lpd4wy1614347943.jpg"
/// strTags : null
/// strYoutube : "https://www.youtube.com/watch?v=JYtMjKa6cdY"
/// strIngredient1 : "Sardines"
/// strIngredient2 : "Olive Oil"

class MealDetail {
  MealDetail({
    String? idMeal,
    String? strMeal,
    dynamic strMealAlternate,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strMealThumb,
    dynamic strTags,
    String? strYoutube,
    String? strIngredient1,
    String? strIngredient2,
    String? price,
  }) {
    _idMeal = idMeal;
    _strMeal = strMeal;
    _strMealAlternate = strMealAlternate;
    _strCategory = strCategory;
    _strArea = strArea;
    _strInstructions = strInstructions;
    _strMealThumb = strMealThumb;
    _strTags = strTags;
    _strYoutube = strYoutube;
    _strIngredient1 = strIngredient1;
    _strIngredient2 = strIngredient2;
    _price = price;
  }

  MealDetail.fromJson(dynamic json) {
    _idMeal = json['idMeal'];
    _strMeal = json['strMeal'];
    _strMealAlternate = json['strMealAlternate'];
    _strCategory = json['strCategory'];
    _strArea = json['strArea'];
    _strInstructions = json['strInstructions'];
    _strMealThumb = json['strMealThumb'];
    _strTags = json['strTags'];
    _strYoutube = json['strYoutube'];
    _strIngredient1 = json['strIngredient1'];
    _strIngredient2 = json['strIngredient2'];
    _price = json['price'];
  }

  String? _idMeal;
  String? _strMeal;
  dynamic _strMealAlternate;
  String? _strCategory;
  String? _strArea;
  String? _strInstructions;
  String? _strMealThumb;
  dynamic _strTags;
  String? _strYoutube;
  String? _strIngredient1;
  String? _strIngredient2;
  String? _price;

  MealDetail copyWith({
    String? idMeal,
    String? strMeal,
    dynamic strMealAlternate,
    String? strCategory,
    String? strArea,
    String? strInstructions,
    String? strMealThumb,
    dynamic strTags,
    String? strYoutube,
    String? strIngredient1,
    String? strIngredient2,
    String? price,
  }) => MealDetail(
    idMeal: idMeal ?? _idMeal,
    strMeal: strMeal ?? _strMeal,
    strMealAlternate: strMealAlternate ?? _strMealAlternate,
    strCategory: strCategory ?? _strCategory,
    strArea: strArea ?? _strArea,
    strInstructions: strInstructions ?? _strInstructions,
    strMealThumb: strMealThumb ?? _strMealThumb,
    strTags: strTags ?? _strTags,
    strYoutube: strYoutube ?? _strYoutube,
    strIngredient1: strIngredient1 ?? _strIngredient1,
    strIngredient2: strIngredient2 ?? _strIngredient2,
    price: price ?? _price,
  );

  String? get idMeal => _idMeal;

  String? get strMeal => _strMeal;

  dynamic get strMealAlternate => _strMealAlternate;

  String? get strCategory => _strCategory;

  String? get strArea => _strArea;

  String? get strInstructions => _strInstructions;

  String? get strMealThumb => _strMealThumb;

  dynamic get strTags => _strTags;

  String? get strYoutube => _strYoutube;

  String? get strIngredient1 => _strIngredient1;

  String? get strIngredient2 => _strIngredient2;

  int get price => int.tryParse(_price ?? "0") ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idMeal'] = _idMeal;
    map['strMeal'] = _strMeal;
    map['strMealAlternate'] = _strMealAlternate;
    map['strCategory'] = _strCategory;
    map['strArea'] = _strArea;
    map['strInstructions'] = _strInstructions;
    map['strMealThumb'] = _strMealThumb;
    map['strTags'] = _strTags;
    map['strYoutube'] = _strYoutube;
    map['strIngredient1'] = _strIngredient1;
    map['strIngredient2'] = _strIngredient2;
    map['price'] = _price;
    return map;
  }
}

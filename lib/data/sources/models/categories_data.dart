/// categories : [{"idCategory":"1","strCategory":"Beef","strCategoryThumb":"https://www.themealdb.com/images/category/beef.png","strCategoryDescription":"Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"}]

class CategoriesData {
  CategoriesData({List<Category>? categories}) {
    _categories = categories;
  }

  CategoriesData.fromJson(dynamic json) {
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Category.fromJson(v));
      });
    }
  }

  List<Category>? _categories;

  CategoriesData copyWith({List<Category>? categories}) =>
      CategoriesData(categories: categories ?? _categories);

  List<Category>? get categories => _categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// idCategory : "1"
/// strCategory : "Beef"
/// strCategoryThumb : "https://www.themealdb.com/images/category/beef.png"
/// strCategoryDescription : "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"

class Category {
  Category({
    String? idCategory,
    String? strCategory,
    String? strCategoryThumb,
    String? strCategoryDescription,
  }) {
    _idCategory = idCategory;
    _strCategory = strCategory;
    _strCategoryThumb = strCategoryThumb;
    _strCategoryDescription = strCategoryDescription;
  }

  Category.fromJson(dynamic json) {
    _idCategory = json['idCategory'];
    _strCategory = json['strCategory'];
    _strCategoryThumb = json['strCategoryThumb'];
    _strCategoryDescription = json['strCategoryDescription'];
  }

  String? _idCategory;
  String? _strCategory;
  String? _strCategoryThumb;
  String? _strCategoryDescription;

  Category copyWith({
    String? idCategory,
    String? strCategory,
    String? strCategoryThumb,
    String? strCategoryDescription,
  }) => Category(
    idCategory: idCategory ?? _idCategory,
    strCategory: strCategory ?? _strCategory,
    strCategoryThumb: strCategoryThumb ?? _strCategoryThumb,
    strCategoryDescription: strCategoryDescription ?? _strCategoryDescription,
  );

  String? get idCategory => _idCategory;

  String? get strCategory => _strCategory;

  String? get strCategoryThumb => _strCategoryThumb;

  String? get strCategoryDescription => _strCategoryDescription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idCategory'] = _idCategory;
    map['strCategory'] = _strCategory;
    map['strCategoryThumb'] = _strCategoryThumb;
    map['strCategoryDescription'] = _strCategoryDescription;
    return map;
  }
}

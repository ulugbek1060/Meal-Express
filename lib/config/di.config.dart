// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../data/models/local/cart_item_model.dart' as _i805;
import '../data/repositories/cart_repository_impl.dart' as _i230;
import '../data/repositories/category_repository_impl.dart' as _i324;
import '../data/repositories/meals_repository_impl.dart' as _i498;
import '../data/sources/local/cart_local_storage.dart' as _i963;
import '../data/sources/remote/meals_api.dart' as _i1028;
import '../domain/repositories/cart_repository.dart' as _i463;
import '../domain/repositories/category_repository.dart' as _i410;
import '../domain/repositories/meal_repository.dart' as _i279;
import '../presentation/meals_screen/providers/categories_provide.dart' as _i31;
import '../presentation/meals_screen/providers/meal_detail_provider.dart'
    as _i791;
import '../presentation/meals_screen/providers/meals_provider.dart' as _i534;
import '../presentation/providers/cart_provider.dart' as _i122;
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i361.Dio>(() => appModule.dio);
    gh.singleton<_i979.Box<_i805.CartItemModel>>(() => appModule.getCatBoc());
    gh.singleton<_i1028.MealApi>(() => _i1028.MealApi(gh<_i361.Dio>()));
    gh.singleton<_i279.MealRepository>(
        () => _i498.MealsRepositoryImpl(gh<_i1028.MealApi>()));
    gh.singleton<_i963.CartLocalStorage>(
        () => _i963.CartLocalStorage(gh<_i979.Box<_i805.CartItemModel>>()));
    gh.factory<_i534.MealsProvider>(
        () => _i534.MealsProvider(gh<_i279.MealRepository>()));
    gh.factory<_i791.MealDetailProvider>(
        () => _i791.MealDetailProvider(gh<_i279.MealRepository>()));
    gh.singleton<_i410.CategoryRepository>(
        () => _i324.CategoryRepositoryImpl(gh<_i1028.MealApi>()));
    gh.singleton<_i463.CartRepository>(
        () => _i230.CartRepositoryImpl(gh<_i963.CartLocalStorage>()));
    gh.factory<_i31.CategoriesProvider>(
        () => _i31.CategoriesProvider(gh<_i410.CategoryRepository>()));
    gh.factory<_i122.CartProvider>(
        () => _i122.CartProvider(gh<_i463.CartRepository>()));
    return this;
  }
}

class _$AppModule extends _i913.AppModule {}

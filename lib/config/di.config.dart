// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/sources/meal_source.dart' as _i668;
import '../data/sources/meal_sourve_impl.dart' as _i938;
import '../screens/meals_screen/providers/categories_provide.dart' as _i814;
import '../screens/meals_screen/providers/meals_provider.dart' as _i922;
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
    gh.factory<_i668.MealSource>(() => _i938.MealSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i814.CategoryProvider>(
        () => _i814.CategoryProvider(gh<_i668.MealSource>()));
    gh.factory<_i922.MealsProvider>(
        () => _i922.MealsProvider(gh<_i668.MealSource>()));
    return this;
  }
}

class _$AppModule extends _i913.AppModule {}

import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:meal_express/config/di.config.dart';

import '../data/models/local/cart_item_model.dart';
import '../utils/constants.dart';
import '../utils/dio_config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => await locator.init();

@module
abstract class AppModule {

  @singleton
  Dio get dio => DioConfig.createDio();

  @singleton
  Box<CartItemModel> getCatBoc() => Hive.box(Constants.CART_BOX);

}
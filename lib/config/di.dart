import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:meal_express/config/di.config.dart';

import '../utils/dio_config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => locator.init();

@module
abstract class AppModule {

  @singleton
  Dio get dio => DioConfig.createDio();


}
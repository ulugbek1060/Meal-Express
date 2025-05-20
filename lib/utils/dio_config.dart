
import 'package:dio/dio.dart';

class DioConfig {
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://www.themealdb.com/api/json/v1/1/',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
      ),
    );
  }
}
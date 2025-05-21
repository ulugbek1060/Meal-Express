
import 'package:dio/dio.dart';

import 'constants.dart';

class DioConfig {
  static Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: Constants.BASE_URL,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
      ),
    );
  }
}
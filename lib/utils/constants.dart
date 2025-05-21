
import 'package:dio/dio.dart';

class Constants{
  Constants._();
  // base url
  static const  BASE_URL = 'https://www.themealdb.com/api/json/v1/1/';

  // Network/API Errors
  static const String apiRequestFailed = 'API request failed with status code: ';
  static const String networkError = 'Network error: ';


  // Helper method to format API errors
  static String apiFailure(int? statusCode) => '$apiRequestFailed$statusCode';
  static String dioFailure(DioException e) => '$networkError${e.message}';

  static const CART_BOX = 'cart_box.db';
}
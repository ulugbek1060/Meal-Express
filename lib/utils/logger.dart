import 'package:flutter/foundation.dart';

class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;
  Logger._internal();

  static void debug(dynamic message, {String? tag}) {
    if (kDebugMode) {
      final timestamp = DateTime.now().toIso8601String();
      final prefix = tag != null ? '[$tag]' : '';
      print('$timestamp $prefix $message');
    }
  }

  static void info(dynamic message, {String? tag}) {
    final timestamp = DateTime.now().toIso8601String();
    final prefix = tag != null ? '[$tag]' : '';
    print('$timestamp $prefix $message');
  }

  static void error(dynamic message, {String? tag, Object? error, StackTrace? stackTrace}) {
    final timestamp = DateTime.now().toIso8601String();
    final prefix = tag != null ? '[$tag]' : '';
    print('$timestamp $prefix $message');
    if (error != null) print('ERROR: $error');
    if (stackTrace != null) print('STACKTRACE: $stackTrace');
  }
}
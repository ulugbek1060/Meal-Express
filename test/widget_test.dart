// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:meal_express/main.dart';

void main() {

  double sum = 0;
  for (int i = 1; i <= 100; i++){
    double x = 1 / i;
    sum = sum + x;
    print(x);
  }
  print(sum);

}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meal_express/screens/main_screen.dart';

import 'config/di.dart';
import 'data/db/cart_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(CartItemAdapter());
  // Hive.registerAdapter(MealDetailAdapter());
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainScreen(),
    );
  }
}


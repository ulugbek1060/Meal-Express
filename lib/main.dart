import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meal_express/data/models/local/cart_item_model.dart';
import 'package:meal_express/data/models/local/meal_cart_model.dart';
import 'package:meal_express/presentation/main_screen.dart';
import 'package:meal_express/presentation/providers/cart_provider.dart';
import 'package:meal_express/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'config/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(CartItemModelAdapter());
  Hive.registerAdapter(MealCartModelAdapter());
  await Hive.openBox<CartItemModel>(Constants.CART_BOX);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator.get<CartProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MainScreen(),
      ),
    );
  }
}

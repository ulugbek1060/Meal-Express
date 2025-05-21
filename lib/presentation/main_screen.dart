import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meal_express/presentation/profile_screen/profile_screen.dart';
import 'package:meal_express/presentation/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import 'cart_screen/cart_screen.dart';
import 'home_screen/home_screen.dart';
import 'meals_screen/meals_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const MainScreen());
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MealsScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _selectedIndex,
        onTap: _setIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBold.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            activeIcon: Icon(IconlyBold.buy),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: const CartBadgeIcon(isActive: false),
            activeIcon: const CartBadgeIcon(isActive: true),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            activeIcon: Icon(IconlyBold.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class CartBadgeIcon extends StatelessWidget {
  final bool isActive;

  const CartBadgeIcon({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final itemCount = cartProvider.items.length;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(isActive ? IconlyBold.bag : IconlyLight.bag),
        if (itemCount > 0)
          Positioned(
            top: -4,
            right: -6,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                '$itemCount',
                style: const TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:meal_express/screens/cart_screen/cart_screen.dart';
import 'package:meal_express/screens/home_screen/home_screen.dart';
import 'package:meal_express/screens/meals_screen/meals_screen.dart';
import 'package:meal_express/screens/profile_screen/profile_screen.dart';

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

  final List<Widget> _pages = const [
    HomeScreen(),
    MealsScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> _navItems = const [
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
      icon: Icon(IconlyLight.bag),
      activeIcon: Icon(IconlyBold.bag),
      label: "Cart",
    ),
    BottomNavigationBarItem(
      icon: Icon(IconlyLight.profile),
      activeIcon: Icon(IconlyBold.profile),
      label: "Profile",
    ),
  ];

  void _setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
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
        items: _navItems,
      ),
    );
  }
}
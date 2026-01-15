import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'product_list_screen.dart';
import 'order_list_screen.dart';
import 'sholat_screen.dart';
import 'location_screen.dart';
import 'about_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _page = 0;

  final List<Widget> _screens = [
    ProductListScreen(),
    OrderListScreen(),
    SholatScreen(),
    LocationScreen(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue.shade700,
        height: 60,
        items: const [
          Icon(Icons.shopping_bag, size: 30, color: Colors.white),
          Icon(Icons.receipt_long, size: 30, color: Colors.white),
          Icon(Icons.access_time_filled, size: 30, color: Colors.white),
          Icon(Icons.location_on, size: 30, color: Colors.white),
          Icon(Icons.info, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _screens[_page],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'product_list_screen.dart';
import 'order_list_screen.dart';
import 'sholat_screen.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Agar navbar transparan di atas konten
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blue,
        buttonBackgroundColor: Colors.blue.shade700,
        height: 60,
        items: const <Widget>[
          Icon(Icons.shopping_bag, size: 30, color: Colors.white),
          Icon(Icons.receipt_long, size: 30, color: Colors.white),
          Icon(Icons.access_time_filled, size: 30, color: Colors.white),
          Icon(Icons.logout, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          if (index == 3) {
            // Logika Logout / Kembali ke Login
            Navigator.pushReplacementNamed(context, '/login');
          } else {
            setState(() => _page = index);
          }
        },
      ),
      body: _screens[_page],
    );
  }
}

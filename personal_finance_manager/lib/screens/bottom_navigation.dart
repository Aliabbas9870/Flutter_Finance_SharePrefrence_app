import 'package:flutter/material.dart';
import 'package:personal_finance_manager/screens/add_finance.dart';
import 'package:personal_finance_manager/screens/home_screen.dart';
import 'package:personal_finance_manager/screens/product_screen.dart';
import 'package:personal_finance_manager/screens/profile.dart';

class BottomNavigation extends StatefulWidget {
  final String name;
  final String email;

  BottomNavigation({required this.name, required this.email});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  late List<Widget> bodyItems;

  @override
  void initState() {
    super.initState();
    bodyItems = [
      HomeScreen(
        name: widget.name,
        email: widget.email,
      ),
      AddFinance(),
      ProductScreen(),
      Profile(name: widget.name),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyItems[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff7776B3),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Color(0xff7776B3),
              icon: Icon(Icons.home),
              label: "Home",
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff7776B3),
            icon: Icon(Icons.add),
            label: "Add",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xff7776B3),
            icon: Icon(Icons.production_quantity_limits),
            label: "Product",
          ),
          BottomNavigationBarItem(
              backgroundColor: Color(0xff7776B3),
              icon: Icon(Icons.person),
              label: "Profile"),
        ],
      ),
    );
  }
}

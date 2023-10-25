import 'package:boycott_center/presentation/drawable/home_appbar.dart';
import 'package:boycott_center/presentation/fragment/home_fragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../drawable/custom_navbar.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  final PageController _pageController = PageController(initialPage: 1);
  int _selectedIndex = 1;

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const HomeAppBar(),
      body:PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe navigation
        children: const [
          HomeFragment()
        ],
      ),
      bottomNavigationBar: CustomNavBar(onTap: _onNavBarItemTapped,),
    );
  }
}

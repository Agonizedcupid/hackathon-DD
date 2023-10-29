import 'package:boycott_center/common/icon_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final Function(int) onTap;

  const CustomNavBar({super.key, required this.onTap});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavItem(0, homeIcon, "", const Color(0xff71828A)),
          _buildNavItem(1, searchIcon, "", const Color(0xff71828A)),
          _buildNavItem(2, scannerIcon, "", const Color(0xff71828A)),
          _buildNavItem(3, justStartedIcon, "", const Color(0xff71828A)),
          _buildNavItemWithIcon(4, Icons.account_circle_outlined, "", const Color(0xff71828A)),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label, Color iconColor) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _selectedIndex == index ? const Color(0xffEEF8F5) : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                color: _selectedIndex == index ? const Color(0xff52B69A) : iconColor,
              ),
              // Text(
              //   label,
              //   style: TextStyle(
              //     color: _selectedIndex == index ? const Color(0xff52B69A) : iconColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItemWithIcon(int index, IconData icon, String label, Color iconColor) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _selectedIndex == index ? const Color(0xffEEF8F5) : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: _selectedIndex == index ? const Color(0xff52B69A) : iconColor,
              ),
              // Text(
              //   label,
              //   style: TextStyle(
              //     color: _selectedIndex == index ? const Color(0xff52B69A) : iconColor,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
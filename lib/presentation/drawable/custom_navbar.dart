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
      height: 80,
      margin: const EdgeInsets.only(left: 33, right: 33, bottom: 20),
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
        children: [
          _buildNavItem(0, Icons.home_outlined, "Home", const Color(0xff71828A)),
          _buildNavItem(1, CupertinoIcons.search, "Search", const Color(0xff71828A)),
          _buildNavItem(2, Icons.add_card_sharp, "Add", const Color(0xff71828A)),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, Color iconColor) {
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
              Text(
                label,
                style: TextStyle(
                  color: _selectedIndex == index ? const Color(0xff52B69A) : iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
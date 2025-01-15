import 'package:flutter/material.dart';
import '../models/navigation_item.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final List<NavigationItem> items;

  const CustomBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: items.map((item) => BottomNavigationBarItem(
        icon: Icon(item.icon),
        label: item.label,
      )).toList(),
      onTap: onItemSelected,
    );
  }
}
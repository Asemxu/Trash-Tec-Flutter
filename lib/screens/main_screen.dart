import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/custom_bottom_nav_widget.dart';
import '../helpers/constants/navigation_item.dart';
import '../models/home_content.dart';
import '../widgets/error_boundary_widget.dart';
import 'home_screen.dart';
import 'calendar_screen.dart';
import 'recycling_screen.dart';
import '../services/home_content_service.dart';
import 'more_screen.dart';
import 'centers_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(navigationItems[selectedIndex].label),
      ),
      body: ErrorBoundary(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            HomeScreen(),
            CalendarScreen(),
            CenterScreen(),
            RecyclingScreen(),
            MoreScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: handleNavigationTap,
        items: navigationItems.map((item) => BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label,
        )).toList(),
      ),
    );
  }

  void handleNavigationTap(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          selectedIndex = index;
        });
      }
    });
  }
}
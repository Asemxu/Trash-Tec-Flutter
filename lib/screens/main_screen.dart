import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/custom_bottom_nav_widget.dart';
import '../helpers/constants/navigation_item.dart';
import '../models/home_content.dart';
import '../widgets/error_boundary_widget.dart';
import 'home_screen.dart';
import '../services/home_content_service.dart';
import 'home_screen_skeleton.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late Future<HomeScreenData> _homeDataFuture;
  final HomeContentService _contentService = HomeContentService();

  @override
  void initState() {
    super.initState();
    _homeDataFuture = _loadHomeData();
  }

  Future<HomeScreenData> _loadHomeData() async {
    await Future.delayed(const Duration(seconds: 2));
    final facts = await _contentService.getFacts();
    final categories = await _contentService.getCategories();
    final benefits = await _contentService.getBenefits();
    final reasons = await _contentService.getReasons();

    return HomeScreenData(
      facts: facts,
      categories: categories,
      benefits: benefits,
      reasons: reasons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(navigationItems[_selectedIndex].label),
      ),
      body: ErrorBoundary(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            FutureBuilder<HomeScreenData>(
              future: _homeDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return HomeScreenSkeleton();
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return Center(child: Text('No data available'));
                }
                
                return HomeScreen(
                  facts: snapshot.data!.facts,
                  categories: snapshot.data!.categories,
                  benefits: snapshot.data!.benefits,
                  reasons: snapshot.data!.reasons,
                );
              },
            ),
            // const CalendarScreen(),
            // const CenterScreen(),
            // const RecyclingScreen(),
            // const MoreScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _handleNavigationTap,
        items: navigationItems.map((item) => BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label,
        )).toList(),
      ),
    );
  }

  void _handleNavigationTap(int index) {
    setState(() => _selectedIndex = index);
  }
}
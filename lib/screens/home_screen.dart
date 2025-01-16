import 'package:flutter/material.dart';
import '../models/home_content.dart';
import './skeleton/home_screen_skeleton.dart';
import '../services/home_content_service.dart';
import '../widgets/home/home_screen_content_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<HomeScreenData> homeDataFuture;
  final HomeContentService contentService = HomeContentService();

  @override
  void initState() {
    super.initState();
    homeDataFuture = loadHomeData();
  }

  Future<HomeScreenData> loadHomeData() async {
    final facts = await contentService.getFacts();
    final categories = await contentService.getCategories();
    final benefits = await contentService.getBenefits();
    final reasons = await contentService.getReasons();

    return HomeScreenData(
      facts: facts,
      categories: categories,
      benefits: benefits,
      reasons: reasons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeScreenData>(
      future: homeDataFuture,
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
        
        return HomeScreenContent(data: snapshot.data!);
      },
    );
  }
}
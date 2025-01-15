// lib/screens/fact_screen.dart
import 'package:flutter/material.dart';
import '../widgets/page_content_widget.dart';
import '../models/page_content.dart'; 
import '../services/page_content_service.dart';
import 'login_screen.dart';

class FactScreen extends StatefulWidget {
  @override
  _FactScreenState createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  late Future<List<PageContent>> futurePageContents; 
  final PageContentService pageContentService = PageContentService();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _numPages = 5;

  @override
  void initState() {
    super.initState();
    futurePageContents = pageContentService.fetchPageContents();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trash Tec'),
      ),
      body: FutureBuilder<List<PageContent>>(
        future: futurePageContents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found.'));
          }

          final pageContents = snapshot.data!;
          return PageView(
            controller: _pageController,  // Add controller here
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: pageContents.map((content) {
              return PageContentWidget(
                imagePath: content.imagePath,
                title: content.title,
                description: content.description,
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: List<Widget>.generate(
                _numPages,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.green : Colors.grey,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_currentPage < _numPages - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              },
              child: Text(_currentPage < _numPages - 1 ? 'SIGUIENTE' : 'EMPEZAR'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/main_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trash Tec',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainScreen(),
      // home: SplashScreen(),

    );
  }
}

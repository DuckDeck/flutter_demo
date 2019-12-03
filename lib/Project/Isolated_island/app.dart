import 'package:flutter/material.dart';
import 'package:flutter_demo/Widget/widget_bottom_navigation_bar.dart';
import 'package:flutter_demo/Project/Isolated_island/splash_screen_page.dart';
class Island extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "孤岛",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: SplashScreenPage(),
  );
  }
}
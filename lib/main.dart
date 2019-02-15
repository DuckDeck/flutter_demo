import 'package:flutter/material.dart';
import 'package:flutter_demo/view/RandomWordsState.dart';
import 'layout.dart';
import 'package:flutter_demo/view/FloatingBottomBar.dart';
import 'package:flutter_demo/Novel/Page/NovelSearchPage.dart';
import 'package:flutter_demo/view/BottomNavigationWidget.dart';
import 'package:flutter_demo/view/NavigationAnimate.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Welcome to flutter',
      theme: new ThemeData(primaryColor: Colors.purple),
      home: new FirstPage()
      );
    
  }
}



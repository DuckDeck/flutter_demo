import 'package:flutter/material.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      builder: (BuildContext context,Widget child){
        return FlutterEasyLoading(child: child);
      },
    );
  }
}


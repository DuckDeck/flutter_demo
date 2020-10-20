import 'package:flutter/material.dart';
import 'package:flutter_demo/home.dart';

class TsTabBar extends StatelessWidget {
  static final tabs = [
    {
      'title':Text("首页"),
      'icon':Icon(Icons.home),
      'builder':(BuildContext context) => HomePage()
    },
    {
      'title':Text("发布"),
      'icon':Icon(Icons.add),
     //'builder':(BuildContext context) => HomePage()
    },
    {
      'title':Text("我的"),
      'icon':Icon(Icons.account_circle),
      //'builder':(BuildContext context) => HomePage()
    }
  ];

  final int tabIndex;

TsTabBar({Key key,this.tabIndex = 0}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
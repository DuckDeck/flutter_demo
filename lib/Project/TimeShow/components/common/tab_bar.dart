import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/TimeShow/pages/home.dart';
import 'package:flutter_demo/Project/TimeShow/pages/tab.dart';


class TsTabBar extends StatelessWidget {
  static final tabs = [
    {
      'title':Text("首页"),
      'icon':Icon(Icons.home),
      'builder':(BuildContext context) => TsHomePage()
    },
    {
      'title':Text("发布"),
      'icon':Icon(Icons.add),
     'builder':(BuildContext context) => TsHomePage()
    },
    {
      'title':Text("我的"),
      'icon':Icon(Icons.account_circle),
      'builder':(BuildContext context) => TsHomePage()
    }
  ];

  final int tabIndex;

TsTabBar({Key key,this.tabIndex = 0}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: tabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index)=>TabPage.globalKey.currentState.switchTab(index),
      items: tabs.map<BottomNavigationBarItem>((v) => BottomNavigationBarItem(
        icon: v['icon'],
        label: v['title']
      )).toList(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/TimeShow/components/common/tab_bar.dart';

class TabPage extends StatefulWidget {
  static final globalKey = GlobalKey<_TabPageState>();
  TabPage():super(key: globalKey);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final _nabigationLKeys = TsTabBar.tabs.map<GlobalKey<NavigatorState>>((e) => GlobalKey<NavigatorState>()).toList();
  final _focusScopeNodes = TsTabBar.tabs.map<FocusScopeNode>((e) => FocusScopeNode()).toList();
  var _tabIndex = 0;
  void switchTab(int index){
    setState(() {
      _tabIndex = index;
    });
    FocusScope.of(context).setFirstFocus(_focusScopeNodes[index]);
  }

Future<bool> _onWillPop() async{
  final maybePop = await _nabigationLKeys[_tabIndex].currentState.maybePop();
  return Future.value(!maybePop);
}

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
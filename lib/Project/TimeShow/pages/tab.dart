import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/TimeShow/components/common/tab_bar.dart';

class TabPage extends StatefulWidget {
  static final globalKey = GlobalKey<_TabPageState>();
  TabPage():super(key: globalKey);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final _navigatorLKeys = TsTabBar.tabs.map<GlobalKey<NavigatorState>>((e) => GlobalKey<NavigatorState>()).toList();
  final _focusScopeNodes = TsTabBar.tabs.map<FocusScopeNode>((e) => FocusScopeNode()).toList();
  var _tabIndex = 0;
  void switchTab(int index){
    setState(() {
      _tabIndex = index;
    });
    FocusScope.of(context).setFirstFocus(_focusScopeNodes[index]);
  }

Future<bool> _onWillPop() async{
  final maybePop = await _navigatorLKeys[_tabIndex].currentState.maybePop();
  return Future.value(!maybePop);
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: IndexedStack(
        index: _tabIndex,
        children: TsTabBar.tabs.asMap().entries.map<Widget>((entry) => FocusScope(
          node: _focusScopeNodes[entry.key],
          child: Navigator(
            key: _navigatorLKeys[entry.key],
            onGenerateRoute: (settings) {
              WidgetBuilder builder;
              switch(settings.name){
                case '/':
                builder = entry.value['builder'];
                break;
                default:
                throw Exception('invalid route : ${settings.name}');
              }
              return MaterialPageRoute(builder: builder,settings: settings);
            },
          ),
        )),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Tool/NavigationTransition.dart';
import 'package:flutter_demo/UI/ListViewPage.dart';
import 'package:flutter_demo/UI/FloatingBottomBar.dart';
import 'package:flutter_demo/UI/SearchBar.dart';
import 'package:flutter_demo/UI/Shopping.dart';
import 'package:flutter_demo/UI/TurnBox.dart';
import 'package:flutter_demo/Tool/Animation.dart';
const items = [
  "无限滚动的ListView","下面有悬浮按钮的BottomBar","搜索条","购物车","TuenBox","动画效果","Hero动画","Stagger动画","计数器动画"
];

class LayoutListPage extends StatefulWidget {
  _LayoutListPageState createState() => _LayoutListPageState();
}

class _LayoutListPageState extends State<LayoutListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("布局"),),
        body: ListView.builder(itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              gotoPage(index,context);
            },
            child: ListTile(title: Text(items[index]),),
          );
        },
        itemCount: items.length,),
        );
      
  }
void gotoPage(int index,BuildContext context) {
      print(index);
      switch (index) {
        case 0:
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
               return InfiniteListView();
              }));
          break;
          case 1:
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
               return FloatingBottomAppBar();
              }));
          break;
           case 2:
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
               return SearchBar();
              }));
          break;
          case 3:
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
               List<Product> items = [Product(name: "stan"),Product(name: "zoe")];
               return ShoppingList(products: items,);
              }));
          break;
           case 4:
             Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
               return TurnBoxRoute();
              }));
          break;
          case 5:
             Navigator.of(context).push(SlideTransitionRoute(ScaleAnimationRoute()));
          break;
          case 6:
              Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
               return HeroAnimationRoute();
              }));
          break;
           case 7:
             Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
               return StaggerRoute();
              }));
          break;
          case 8:
             Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
               return AnimatedSwitcherCounterRoute();
              }));
          break;
        default:
      }
  }
}
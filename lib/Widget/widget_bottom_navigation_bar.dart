import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_demo/Project/Isolated_island/book_list_page.dart';
import 'package:flutter_demo/Project/Isolated_island/home_page.dart';
import 'package:flutter_demo/Project/Isolated_island/love_page.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> with SingleTickerProviderStateMixin {
  
  TabController tabController;
  List _pages = [HomePage(),BookListPage(),LovePage()];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this,length: 3)..addListener((){
      setState(() {
        currentIndex = tabController.index;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        items: <Widget>[
          Image.asset("Images/home.png",width: 30,height: 30,),
          Image.asset("Images/book.png",width: 30,height: 30,),
          Image.asset("Images/like.png",width: 30,height: 30,),
        ],
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
          tabController.animateTo(index,duration: Duration(milliseconds: 300),curve: Curves.ease);
        },
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Container(child: _pages[0],),
          Container(child: _pages[1],),
          Container(child: _pages[2],)
        ],
      ),
    );
  }
}
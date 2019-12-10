import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'model.dart';
class MainImageList extends StatefulWidget {
  @override
  _MainImageListState createState() => _MainImageListState();
}

class _MainImageListState extends State<MainImageList>  with SingleTickerProviderStateMixin {

  var titles = [Cat(name: "最新",urlSegment: "new"),Cat(name: "风景",urlSegment: "4kfengjing"),
  Cat(name: "美女",urlSegment: "4kmeinv"),Cat(name: "游戏",urlSegment: "4kyouxi"),
  Cat(name: "动漫",urlSegment: "4kdongman"),Cat(name: "影视",urlSegment: "4kyingshi"),
  Cat(name: "明星",urlSegment: "4kmingxing"),Cat(name: "明星",urlSegment: "4kqiche"),
  Cat(name: "动物",urlSegment: "4kdongwu"),Cat(name: "汽车",urlSegment: "4krenwu"),
  Cat(name: "美食",urlSegment: "4kmeishi"),Cat(name: "宗教",urlSegment: "4kzongjiao"),
  Cat(name: "背景",urlSegment: "4kbeijing"),];
  var imgs = [
    Image.asset("Images/head1.jpg"),
    Image.asset("Images/head2.jpg"),
    Image.asset("Images/head3.jpg"),
    Image.asset("Images/head3.jpg"),
    Image.asset("Images/head1.jpg"),
    Image.asset("Images/head2.jpg"),
    Image.asset("Images/head3.jpg"),
    Image.asset("Images/head3.jpg"),
    Image.asset("Images/head1.jpg"),
    Image.asset("Images/head2.jpg"),
    Image.asset("Images/head3.jpg"),
    Image.asset("Images/head3.jpg"),
    Image.asset("Images/head1.jpg"),

  ];

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        appBar: AppBar(title: const Text("Tabbed Appbar"), bottom: TabBar(
          isScrollable: true,
          tabs:titles.map((title){
            return Tab(text: title.name,);
          }).toList(),
        ),),
        body: TabBarView(
          children: imgs.map((img){
            return Padding(padding: EdgeInsets.all(16.0), child:img);
          }).toList()
        ),
      ),
    );
  }
}
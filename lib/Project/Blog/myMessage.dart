import 'package:flutter/material.dart';

class MyMessagePage extends StatefulWidget {
  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage>
    with SingleTickerProviderStateMixin {
  var currentType = 1;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)..addListener(() { 
      print(_tabController.index);
    });
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("我的消息"),
            bottom: TabBar(
              controller: _tabController,
              tabs: [
              Tab(icon: Icon(Icons.comment,size: 30,),text: "评论",),
              Tab(icon: Icon(Icons.favorite,size: 30,),text: "喜欢和赞",),
              Tab(icon: Icon(Icons.beach_access,size: 30,),text: "关注",),
              Tab(icon: Icon(Icons.message,size: 30,),text: "私信",),
            ]),
          ),
          body: TabBarView(children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
          ]),
        ));

    void getMessage() async {
      
    }
  }
}

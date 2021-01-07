import 'package:flutter/material.dart';

class MyMessagePage extends StatefulWidget {
  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: Scaffold(
      appBar: AppBar(
        title: Text("我的消息"),
        bottom: TabBar(
          
          tabs: [
          Container(child: Column(children: [
            Icon(Icons.comment),
            Text("评论")
          ],),),
          Column(children: [
            Icon(Icons.comment),
            Text("评论")
          ],),
          Column(children: [
            Icon(Icons.comment),
            Text("评论")
          ],),
          Column(children: [
            Icon(Icons.comment),
            Text("评论")
          ],),
             
        ]),
      ),
      body: TabBarView(children: [Text("data"),Text("data"),Text("data"),Text("data"),]),
    ));
  }
}

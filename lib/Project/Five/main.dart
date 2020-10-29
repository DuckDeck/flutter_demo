import 'package:flutter/material.dart';

class FiveStrokePage extends StatefulWidget {
  @override
  _FiveStrokePageState createState() => _FiveStrokePageState();
}

class _FiveStrokePageState extends State<FiveStrokePage> {
  ScrollController _scrollController = ScrollController();
  
int _page = 0;
int _eLoading = 0; //0不显示 1 正在请求 2 没有更多数据
List<FiveStrokeInfo> items = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Row(children:[
        Column(children: [
          
        ],)
      ]),

    );
  }
}

class FiveStrokeInfo{
  var id = 0;
  var text = "";
  var pinyin = "";
  var img = "";
  var code = "";
}
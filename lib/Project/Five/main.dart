import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FiveStrokePage extends StatefulWidget {
  @override
  _FiveStrokePageState createState() => _FiveStrokePageState();
}

class _FiveStrokePageState extends State<FiveStrokePage> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _textEditingController = TextEditingController();
  int _page = 0;
  int _eLoading = 0; //0不显示 1 正在请求 2 没有更多数据

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      print(_textEditingController.text);
    });
  }

  List<FiveStrokeInfo> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("五笔反查"),
        ),
        body: Container(
          child: Column(children: [
             Row(children: [
               Expanded(child: TextField(controller: _textEditingController,),),
                SizedBox(
                  child: IconButton(icon: Icon(Icons.search), onPressed: search),
                  width: 40,
                )
             ],),
             Expanded(child: 
              ListView.builder(itemBuilder: (BuildContext context,int index){
                return ListTile(title: Text("123"));
              },itemCount: items.length,)
             )
          ],)
        ));
  }

  void search() {
    print("search");
    if(_textEditingController.text.length <= 0){
      Fluttertoast.showToast(msg: "请输入文字");
      return;
    }
    const regex = r"[\\u4e00-\\u9fa5]";
    var res =  RegExp(regex).firstMatch(_textEditingController.text);
    if(res == null){
      Fluttertoast.showToast(msg: "请输入中文");
      return;
    }
    
    
  }
}

class FiveStrokeInfo {
  var id = 0;
  var text = "";
  var pinyin = "";
  var img = "";
  var code = "";
}

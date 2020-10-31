import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Five/fiveStrokeInfo.dart';
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
          padding: const EdgeInsets.all(10),
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
                return FiveCell(fiveStrokeInfo: items[index],);
              },itemCount: items.length,),
              
             )
          ],)
        ));
  }

  void search() async {
    if(_textEditingController.text.length <= 0){
      Fluttertoast.showToast(msg: "请输入文字");
      return;
    }
    const regex = r"^[\u4e00-\u9fa5]+$";
    print(_textEditingController.text);    
    if(!RegExp(regex).hasMatch(_textEditingController.text)){
      Fluttertoast.showToast(msg: "请输入中文");
      return;
    }
    
    final data = await FiveStrokeInfo.getFiveStroke(_textEditingController.text);
    if(data.code != 0){
      Fluttertoast.showToast(msg: data.msg);
      return;
    }
    setState(() {
      items.addAll(data.data);
    });
    
  }
}


class FiveCell extends StatelessWidget {
  final FiveStrokeInfo fiveStrokeInfo;
  FiveCell({this.fiveStrokeInfo});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(children: [
        Expanded(child: Text(fiveStrokeInfo.text),flex: 1,),
        Expanded(child: Text(fiveStrokeInfo.pinyin),flex: 2,),
        Expanded(child: Text(fiveStrokeInfo.code),flex: 2,),
        Expanded(child: CachedNetworkImage(imageUrl: fiveStrokeInfo.img,),flex: 3,)
      ],),
    );
  }
}

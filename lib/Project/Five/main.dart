import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Five/fiveStrokeInfo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

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
    getFives().then((value) => setData(value));
    _textEditingController.addListener(() {
      print(_textEditingController.text);
    });
  }

  void setData(List<FiveStrokeInfo> fives) {
    
    setState(() {
      items.addAll(fives);
      saveFives(items);
    });
  }

  List<FiveStrokeInfo> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("五笔反查"), actions: [
          IconButton(icon: Icon(Icons.delete), onPressed: showDeleteAction)
        ]),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                      ),
                    ),
                    SizedBox(
                      child: IconButton(
                          icon: Icon(Icons.search), onPressed: search),
                      width: 40,
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        child: FiveCell(
                          fiveStrokeInfo: items[index],
                        ),
                        movementDuration: Duration(microseconds: 100),
                        key: Key(items[index].code),
                        onDismissed: (_) {
                          print(index);
                        },
                        background: Container(
                          child: Text('右滑删除', style: TextStyle(fontSize: 22, color: Colors.white)),
                          color: Colors.red,
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                        ),
                      );
                    },
                    itemCount: items.length,
                  ),
                )
              ],
            )));
  }

  void search() async {
    if (_textEditingController.text.length <= 0) {
      Fluttertoast.showToast(msg: "请输入文字");
      return;
    }
    const regex = r"^[\u4e00-\u9fa5]+$";
    print(_textEditingController.text);
    if (!RegExp(regex).hasMatch(_textEditingController.text)) {
      Fluttertoast.showToast(msg: "请输入中文");
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());
    EasyLoading.show(status: "加载中");
    final data =
        await FiveStrokeInfo.getFiveStroke(_textEditingController.text);
    EasyLoading.dismiss();
    if (data.code != 0) {
      Fluttertoast.showToast(msg: data.msg);
      return;
    }
  
    setData(data.data);
  }

  Future<File> getDataFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    var path = Directory(dir + "/" + "five");
    if (!path.existsSync()) {
      path.createSync();
    }
    final filePath = path.path + "/" + "five.text";
    return new File(filePath);
  }

  Future<List<FiveStrokeInfo>> getFives() async {
    final file = await getDataFile();
    final contents = await file.readAsString();
    List<dynamic> items = jsonDecode(contents);
    List<FiveStrokeInfo> fives = List<FiveStrokeInfo>();
    for (var item in items) {
      final five = FiveStrokeInfo.fromJson(item);
      fives.add(five);
    }
    return fives;
  }

  void saveFives(List<FiveStrokeInfo> fives) async {
    final file = await getDataFile();
    final data = jsonEncode(fives);
    print(data);
    file.writeAsString(data);
  }

  void showDeleteAction() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示删除"),
            content: Text("你确定要删除全部缓存吗？"),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("取消")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    deleteData();
                  },
                  child: Text("删除")),
            ],
          );
        });
  }

  void deleteData() {
    items.removeRange(0, items.length);

    setData(items);
  }
}

class FiveCell extends StatelessWidget {
  final FiveStrokeInfo fiveStrokeInfo;
  FiveCell({this.fiveStrokeInfo});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Text(fiveStrokeInfo.text),
                flex: 1,
              ),
              Expanded(
                child: Text(fiveStrokeInfo.pinyin),
                flex: 2,
              ),
              Expanded(
                child: Text(fiveStrokeInfo.code),
                flex: 2,
              ),
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: fiveStrokeInfo.img,
                ),
                flex: 3,
              )
            ],
          ),
        ));
  }
}

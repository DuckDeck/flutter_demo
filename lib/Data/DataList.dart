import 'package:flutter/material.dart';
import 'package:flutter_demo/Layout/ListViewPage.dart';
import 'package:flutter_demo/Data/ReadWriteData.dart';
const items = [
  "读写文件"
];

class DataListPage extends StatefulWidget {
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("数据和文件"),),
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
               return ReadWriteData();
              }));
          break;
        default:
      }
  }
}
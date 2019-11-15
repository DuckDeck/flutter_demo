import 'package:flutter/material.dart';
import 'package:flutter_demo/Tool/NavigationTransition.dart';
import 'package:flutter_demo/Data/readWriteFile.dart';
const items = [
  "读写文件"
];

class DataMenuPage extends StatefulWidget {
  _DataMenuPageState createState() => _DataMenuPageState();
}

class _DataMenuPageState extends State<DataMenuPage> {
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
             Navigator.of(context).push(new SlideTransitionRoute(
                ReadWriteFile()
              ));
          break;
        default:
      }
  }
}
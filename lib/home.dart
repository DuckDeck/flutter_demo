import 'package:flutter/material.dart';
import 'package:flutter_demo/UI/menu.dart';
import 'package:flutter_demo/Touch/menu.dart';
import 'package:flutter_demo/Data/menu.dart';
import 'package:flutter_demo/Media/menu.dart';
import 'package:flutter_demo/Project/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/Foundation/menu.dart';
import 'Project/Blog/Tool/Extension.dart';
const items = ["基础", "触摸&手势", "UI和布局", "数据和文件", "影音多媒体", "独立项目"];

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return 
       
        Scaffold(
          appBar: AppBar(
            title: Text("Flutter Demo"),
          ),
          body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  gotoPage(index, context);
                },
                child: ListTile(
                  title: Text(items[index]),
                ),
              );
            },
            itemCount: items.length,
          ),
        );
  }

  void gotoPage(int index, BuildContext context) {
    print(index);
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/foundation");
        break;
      case 1:
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return TouchMenuPage();
        }));
        break;
      case 2:
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return LayoutListPage();
        }));
        break;
      case 3:
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (BuildContext context) {
          return DataMenuPage();
        }));
        break;
      case 4:
         Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                return MediaMenuPage();
              }));
        break;
      case 5:
         Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                return ProjectMenuPage();
              }));
        break;
      default:
    }
  }
}

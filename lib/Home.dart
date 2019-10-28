import 'package:flutter/material.dart';
import 'package:flutter_demo/Layout/LayoutList.dart';
import 'package:flutter_demo/Project/ProjectList.dart';
import 'package:flutter_demo/Touch/TouchList.dart';
import 'package:flutter_demo/Data/DataList.dart';
const items = [
  "Touch&Gesture","Project","Layout","数据和文件"
];
class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Welcome to flutter',
      theme: new ThemeData(primaryColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Demo"),),
        body: ListView.builder(itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              gotoPage(index,context);
            },
            child: ListTile(title: Text(items[index]),),
          );
        },
        itemCount: items.length,),
        )
      );
    
  }

  void gotoPage(int index,BuildContext context) {
      print(index);
      switch (index) {
        case 0:
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return TouchListPage();
      }));
      break;
       case 1:
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return ProjectListPage();
      }));
          break;
          case 2:
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return LayoutListPage();
      }));
       break;
          case 3:
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return DataListPage();
      }));
          break;
        default:
      }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_demo/UI/menu.dart';
import 'package:flutter_demo/Touch/menu.dart';
import 'package:flutter_demo/Data/menu.dart';
const items = [
  "触摸&手势","UI和布局","数据和文件"
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
              return TouchMenuPage();
      }));
      break;
       case 1:
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return LayoutListPage();
      }));
          break;
          case 2:
            Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return DataMenuPage();
      }));
       break;
         
        default:
      }
  }
}
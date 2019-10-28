import 'package:flutter/material.dart';
import 'package:flutter_demo/Touch/DragItem.dart';
const items = [
  "Drag"
];

class TouchListPage extends StatefulWidget {
  _TouchListPageState createState() => _TouchListPageState();
}

class _TouchListPageState extends State<TouchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        );
      
  }
void gotoPage(int index,BuildContext context) {
      print(index);
      switch (index) {
        case 0:
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
              return DragItemPage();
              }));
          break;
        default:
      }
  }
  
}
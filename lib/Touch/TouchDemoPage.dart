import 'package:flutter/material.dart';
import 'package:flutter_demo/Touch/Drag/Drag.dart';
const items = [
  "Drag"
];

class TouchDamoPage extends StatefulWidget {
  _TouchDamoPageState createState() => _TouchDamoPageState();
}

class _TouchDamoPageState extends State<TouchDamoPage> {
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
              return DraggablePage();
              }));
          break;
        default:
      }
  }
  
}
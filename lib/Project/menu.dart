import 'package:flutter/material.dart';
import 'package:flutter_demo/Tool/NavigationTransition.dart';
import 'package:flutter_demo/Project/Isolated_island/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/Project/4KImage/main_image_list.dart';
import 'package:flutter_demo/Project/4KImage/tool.dart';
import 'TimeBooking/main.dart';
const items = [
  "孤岛","美图","TimeCarving",
];

class ProjectMenuPage extends StatefulWidget {
  _ProjectMenuPageState createState() => _ProjectMenuPageState();
}

class _ProjectMenuPageState extends State<ProjectMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("多媒体"),),
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

         Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                return Island();
              }));
             
          break;
          case 1:

         Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                return ImgReduxApp();
              }));
             
          break;
         case 2:

         Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                return TimeCarvingPage();
              }));
             
          break;
        default:
      }
  }
}
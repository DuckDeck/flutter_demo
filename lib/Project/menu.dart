import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/4KImage/main_image_list.dart';
import 'package:flutter_demo/Project/Blog/main.dart';
import 'package:flutter_demo/Project/Five/main.dart';
import 'package:flutter_demo/Project/Isolated_island/app.dart';
import 'package:flutter/cupertino.dart';

import 'TimeBooking/main.dart';
const items = [
  "孤岛","美图","TimeCarving","五笔反查","Zoe Blog"
];

class ProjectMenuPage extends StatefulWidget {
  _ProjectMenuPageState createState() => _ProjectMenuPageState();
}

class _ProjectMenuPageState extends State<ProjectMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("独立项目"),),
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
void gotoPage(int index,BuildContext context) async{
      print(index);
      switch (index) {
        case 0:

         Navigator.of(context).pushNamed("/project/isolated");
          break;
          case 1:

          Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                  return MainImageList();
                  
                }));
             
          break;
         case 2:

          var res =  Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                  return TimeCarvingPage();
                }));
            Scaffold.of(context)..removeCurrentSnackBar()..showSnackBar(SnackBar(content: Text('$res'))); 
          break;
           case 3:
            Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
                  return FiveStrokePage();
                }));
                
                break;
          case 4:

                  Navigator.of(context).pushNamed("/project/blog");
             
          break;
        default:
      }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'sweepCode.dart';
const items = [
  "扫码",
];

class MediaMenuPage extends StatefulWidget {
  _MediaMenuPageState createState() => _MediaMenuPageState();
}

class _MediaMenuPageState extends State<MediaMenuPage> {
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
                return ScancodePage();
              }));
          break;
        default:
      }
  }
}
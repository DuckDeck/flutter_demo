import 'package:flutter/material.dart';
import 'package:flutter_demo/Layout/ListViewPage.dart';
const items = [
  "ListView"
];

class LayoutListPage extends StatefulWidget {
  _LayoutListPageState createState() => _LayoutListPageState();
}

class _LayoutListPageState extends State<LayoutListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("布局"),),
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
               return InfiniteListView();
              }));
          break;
        default:
      }
  }
}
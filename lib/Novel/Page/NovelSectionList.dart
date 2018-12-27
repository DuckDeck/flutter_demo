import 'package:flutter/material.dart';
import 'package:flutter_demo/Novel/Model/SectionInfo.dart';

class SectionList extends StatefulWidget{
  const SectionList({ Key key,this.url}):super(key:key);
  final String  url;
  @override
    State<StatefulWidget> createState() => new _SectionListState();
}

class  _SectionListState extends State<SectionList>{
  List<SectionInfo> sections =  List<SectionInfo>();
  
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      SectionInfo.getSectionList(widget.url).then((val){
        setState(() {
          sections = val;
        });
      });
    }

  @override
    Widget build(BuildContext context) {
       return Scaffold(
         appBar: new AppBar(title:new Text("data")),
         body: ListView.builder(
           itemBuilder: (BuildContext context,int index){
              return ListTile(title: Text(sections[index].name),);
           },
           itemCount: sections.length,
         ),
         );
    }



}
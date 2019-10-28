import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadWriteData extends StatefulWidget{
  ReadWriteData({Key key}):super(key:key);
  @override
    State<StatefulWidget> createState() => new _ReadWriteDataState();
}

class _ReadWriteDataState extends State<ReadWriteData>{
  int _counter;
@override
  void initState()  {
    super.initState();

     _readCounter().then((val){
         setState(() {
              _counter = val;
            });
     });
 

  }
@override
 Widget build(BuildContext context){
   return new Scaffold(
     appBar: new AppBar(title: new Text("文件操作"),),
     body: new Center(child: new Text('点击了 $_counter 次'),),
     floatingActionButton: new FloatingActionButton(
       onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: new Icon(Icons.add),
     ),
   );
 }

Future<File> _getLocalFile() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return new File('$dir/counter.txt');
}

Future<int> _readCounter() async{
  try{
    File file = await _getLocalFile();
    String content = await file.readAsString();
    return int.parse(content);
  } on FileSystemException{
    return 0;
  }
}

Future<Null> _incrementCounter() async{
  setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
}


}
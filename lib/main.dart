import 'package:flutter/material.dart';
import 'RandomWordsState.dart';
import 'Shopping.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Welcome to flutter',
      theme: new ThemeData(primaryColor: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: Text('Top Lakes'),),
        body: new Container(padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              new Text("You suck" * 12,textAlign: TextAlign.center),
              new Text("\uE914 \uE000 \uE90D \uE91D", style: TextStyle(fontFamily: "MaterialIcons", fontSize: 34.0, color: Colors.green),),
              new Text("You suck",textScaleFactor: 2.5,style:TextStyle(
                color: Colors.red,background: Paint()..color = Colors.greenAccent,decoration: TextDecoration.lineThrough,
                decorationStyle: TextDecorationStyle.wavy
              ) ),
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: "Home:"),
                  TextSpan(text: "https://youtube.com",style: TextStyle(color: Colors.blue) )
                ]
              ),textAlign: TextAlign.left,),
              RaisedButton(child: Text("A Button"),onPressed: ()=>{},),
              FlatButton(child: Text("A Flat Button"),color: Colors.blue, highlightColor: Colors.blue[700],
              colorBrightness:Brightness.light ,splashColor: Colors.grey, shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0) ), onPressed: ()=>{},),
              OutlineButton(child: Text("A Outline Button"),onPressed: ()=>{},),
              IconButton(icon: Icon(Icons.cake,color: Colors.red,),onPressed: ()=>{},),
              Image(image:AssetImage("images/001.jpg"),color: Colors.blue,colorBlendMode: BlendMode.saturation,),
              Checkbox(onChanged: (bool s)=>{},value: true,)
            ],
          ),)
      )
    );
  }
}













class TutorialHome extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(icon: new Icon(Icons.menu),tooltip: 'Navigation menu',onPressed: null,),
          title: new Text('Example title'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search),tooltip: "Search",onPressed: null,),
          ],
        ),
        body: new Center(
          child: new Counter(),
        ),
        floatingActionButton: new FloatingActionButton(
          tooltip: 'Add',
          child: new Icon(Icons.add),
          onPressed: null,
        ),
      );
    }
}


class MyButton extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new GestureDetector(
        onTap: (){
          print("MyButton was tapped!");
        },
        child: new Container(
          height: 36.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: new BoxDecoration(borderRadius: new BorderRadius.circular(5.0),color: Colors.lightGreen[500]),
          child: new Center(
            child: new Text("Engage"),
          ),
        ),
      );
    }
}

class Counter extends StatefulWidget{
  @override
    _CounterSate createState() => new _CounterSate();
}

class _CounterSate extends State<Counter>{
  int _counter = 0;
  void _increment(){
    setState(() {
          _counter++;
        });
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Row(
        children: <Widget>[
          new CounterIncrementor(onPressed: _increment),
          new CounterDisplay(count: _counter,)
        ],
        
      );
    }
}

class CounterDisplay extends StatelessWidget{
  CounterDisplay({this.count});
  final int count;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Text('Count: $count');
    }
}

class CounterIncrementor extends StatelessWidget{
  CounterIncrementor({this.onPressed});
  final VoidCallback onPressed;
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new RaisedButton(
        onPressed:onPressed,
        child:new Text('Increment')
      );
    }
}

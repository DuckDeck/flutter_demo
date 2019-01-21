import 'package:flutter/material.dart';
import 'RandomWordsState.dart';
import 'Shopping.dart';
import 'layout.dart';
import 'file.dart';
import 'http.dart';
import 'TurnBox.dart';
import 'package:flutter_demo/Novel/Page/NovelSearchPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Welcome to flutter',
      theme: new ThemeData(primaryColor: Colors.purple),
      home: new BottomNavigation()
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


class BottomNavigation extends StatefulWidget {
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
   final _BottomNavigationColor = Colors.blue;
   int _currentIndex = 0;
   List<Widget> list = List();
   
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      list
      ..add(HomeScreen(name: "Home",))
      ..add(HomeScreen(name: "Rmail",))
      ..add(HomeScreen(name: "Pages",))
      ..add(HomeScreen(name: "Airplay",));
    }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color:_BottomNavigationColor),title: Text('Home',style:TextStyle(color:_BottomNavigationColor))),
          BottomNavigationBarItem(icon: Icon(Icons.email,color:_BottomNavigationColor),title: Text('Email',style:TextStyle(color:_BottomNavigationColor))),
          BottomNavigationBarItem(icon: Icon(Icons.pages,color:_BottomNavigationColor),title: Text('Pages',style:TextStyle(color:_BottomNavigationColor))),
          BottomNavigationBarItem(icon: Icon(Icons.airplay,color:_BottomNavigationColor),title: Text('Airplay',style:TextStyle(color:_BottomNavigationColor)))
        ],
        type: BottomNavigationBarType.fixed,
        onTap: (int index){
          setState(() {
                      _currentIndex = index;
                    });
        },
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {

  final String name;

  const HomeScreen({Key key,this.name}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.name),),
      body: Center(child: Text(this.name),),
    );
  }
}
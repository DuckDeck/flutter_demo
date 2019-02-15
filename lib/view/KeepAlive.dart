import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  _KeepAlivePageState createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage> with SingleTickerProviderStateMixin{
  TabController _controller;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _controller = TabController(length: 3,vsync: this);
    }

    @override
      void dispose() {
        // TODO: implement dispose
          _controller.dispose();
        super.dispose();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Keep Alive Test"),
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car),),
            Tab(icon: Icon(Icons.directions_transit),),
            Tab(icon: Icon(Icons.directions_bike),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          AlivePage(),
          AlivePage(),
          AlivePage(),
        ],
      ),
    );
  }
}

class AlivePage extends StatefulWidget {
  _AlivePageState createState() => _AlivePageState();
}

class _AlivePageState extends State<AlivePage> with AutomaticKeepAliveClientMixin {
  int _counter = 0;
  @override
    // TODO: implement wantKeepAlive
    bool get wantKeepAlive => true;
    //有时侯热更新没有用

  void _incrementCounter(){
    setState(() {
          _counter++;
        });
  }  

 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("点一下加1，点一下加1"),
          Text('$_counter',style:Theme.of(context).textTheme.display1)
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    ),
    );
  }
}
import 'package:flutter/material.dart';

class FloatingBottomAppBar extends StatefulWidget {
  _FloatingBottomAppBarState createState() => _FloatingBottomAppBarState();
}

class _FloatingBottomAppBarState extends State<FloatingBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

      },
      tooltip: "Increment",
      child: Icon(Icons.add,color: Colors.white,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),color: Colors.white,onPressed: (){

            },),
            IconButton(icon: Icon(Icons.airport_shuttle),color: Colors.white,onPressed: (){

            },)
          ],
        ),
      ),
    );
  }
}



class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget._title),),
      body: Center(child: Text(widget._title),),
    );
  }
}
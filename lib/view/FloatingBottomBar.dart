import 'package:flutter/material.dart';

class FloatingBottomAppBar extends StatefulWidget {
  _FloatingBottomAppBarState createState() => _FloatingBottomAppBarState();
}

class _FloatingBottomAppBarState extends State<FloatingBottomAppBar> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _eachView = List();
    _eachView..add(EachView("Home"))..add(EachView("Me"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
          return EachView("New Page");
        }));
      },
      tooltip: "Increment",
      child: Icon(Icons.add,color: Colors.white,),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _eachView[_index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),color: Colors.white,onPressed: (){
              setState(() {
                _index = 0;
              });
            },),
            IconButton(icon: Icon(Icons.airport_shuttle),color: Colors.white,onPressed: (){
              setState(() {
                _index = 1;
              });
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
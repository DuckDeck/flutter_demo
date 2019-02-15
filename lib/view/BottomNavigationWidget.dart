import 'package:flutter/material.dart';
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
      ..add(HomeScreen(name: "Email",))
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
import 'package:flutter/material.dart';
import 'package:flutter_demo/Home.dart';
class SplashPage extends StatefulWidget {
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(microseconds: 3000));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (route)=>route==null);
      }
    });
    _controller.forward();
  }

  @override
    void dispose() {
      _controller.dispose();
      // TODO: implement dispose
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return  FadeTransition(
      opacity: _animation,
      child: Image.network("http://222.186.12.239:10010/xinggan180730/010.jpg",scale: 2.0,fit: BoxFit.cover,),
      
    );
  }
}
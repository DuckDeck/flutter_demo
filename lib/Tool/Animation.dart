import 'package:flutter/material.dart';
class ScaleAnimationRoute extends StatefulWidget {
  @override

  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}


class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3),vsync: this);
    animation = Tween(begin: 0.0,end: 300.0).animate(controller)..addListener((){
      setState(()=>{});
    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("Images/1.jpg",width:animation.value,height:animation.value),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
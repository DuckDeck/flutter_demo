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
    animation = CurvedAnimation(parent: controller,curve: Curves.easeInOut);
    animation = Tween(begin: 0.0,end: 300.0).animate(controller)..addListener((){
      setState(()=>{});
    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimationImage(animation: animation,)
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class AnimationImage extends AnimatedWidget {
  AnimationImage({Key key,Animation<double> animation}):super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(child: Image.asset("Images/1.jpg",width:animation.value,height:animation.value),);
  }
}


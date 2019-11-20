import 'package:flutter/material.dart';
import 'package:flutter_demo/Tool/Animation.dart';
class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  Color _decorationColor = Colors.blue;
var duration = Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text("动画过渡组件"),),
        body: Center(
          child: AnimatedDecoratedBox(duration: duration,
          child: FlatButton(onPressed: (){
            setState(() {
              _decorationColor = Colors.red;
            });
          },child: Text("AnimatedDecoratedBox",style: TextStyle(color: Colors.white),),),
          ),
        ),
      );
  }
}
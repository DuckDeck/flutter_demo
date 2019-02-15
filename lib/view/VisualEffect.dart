import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network('http://222.186.12.239:10010/agexin_20181226/001.jpg'),
          ),
          Center(child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0,sigmaY: 2.0),
              child: Opacity(opacity: 0.5,
              child: Container(width: 500,height: 700,decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Center(
                child: Text("ShadowEdge",style:Theme.of(context).textTheme.display3),
              ),),),
            ),
          ),)
        ],
      ),
    );
  }
}
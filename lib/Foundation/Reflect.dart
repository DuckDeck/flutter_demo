
import 'package:flutter/material.dart';

class Reflect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


   

    return Scaffold(
      appBar: AppBar(title: Text("反射"),),
      body: Center(
        child: ListView(children: [
         Column(children: [
            Text("Flutter 禁止使用反射。。这个用不了,不知道以后会不会放开",style: TextStyle(fontSize: 30),),
         ],)
        ],)
      ),
    );
  }
}

class Test {
  var name = "";
  var age = 0;
  
}
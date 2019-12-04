import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/Tool/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

jumpPage(){
  return Timer(Duration(milliseconds: 3000),(){
    Navigator.pushReplacementNamed(context, "guidePages");
  });
}

@override
  void initState() {
    super.initState();
    jumpPage();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Images/2.jpg"), fit: BoxFit.cover),
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.2),
                  Color.fromRGBO(0, 0, 0, 0.4)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter)),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Text("欢迎来到孤岛",
                        style: TextStyle(
                            fontSize: fontSize40, fontWeight: FontWeight.w600)),
                    SizedBox(height: 100,),
                    Text("我只是随便写写的",style: TextStyle(
                            fontSize: fontSize40, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

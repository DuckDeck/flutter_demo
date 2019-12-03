import 'package:flutter/material.dart';
import 'package:flutter_demo/Tool/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(0, 0, 0, 0.2), Color.fromRGBO(0, 0, 0, 0.4) ],
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
                    Text("孤岛",
                        style: TextStyle(fontSize: fontSize40, fontWeight: FontWeight.w600))
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_demo/Tool/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // print(fontSize24);
    // print(width100);
    // print(ScreenUtil.textScaleFactory);
    // print(ScreenUtil.getInstance().scaleWidth);
    // print(ScreenUtil.getInstance().setSp(44));
    return Scaffold(
      appBar: AppBar(
        title: Text("我是首页",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(36)),),
      ),
      body: Center(
        
        child: Text("我来专门测试文字的大小我来专门测试文字的大小我来专门测试文字的大小我来专门测试文字的大小",style: TextStyle(fontSize: fontSize24),),
      ),
    );
  }
}
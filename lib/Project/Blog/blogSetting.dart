import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BlogSettingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("系统设置"),
        ),
        body: Container(
          width: screenSize.width,
          color: color_f0f0f0,
          child: Column(
            
            children: [
               FlatButton(
                 onPressed: (){
                   Fluttertoast.showToast(msg: "缓存已经清空");
                 },
                    child: Text(
                      "清空缓存",
                      style: TextStyle(color: color_666666, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  FlatButton(
                    child: Text(
                      "反馈&建议",
                      style: TextStyle(color: color_666666, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  FlatButton(
                    onPressed: (){
                      // http://bqbbq.com/#/aboutVue
                       Navigator.of(context).pushNamed("/project/blog/web",arguments: "http://bqbbq.com/#/aboutVue");
                    },
                    child: Text(
                      "关于ZOE Blog",
                      style: TextStyle(color: color_666666, fontSize: 18),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20,),
                  Divider(),
                  FlatButton(
                    child: Text(
                      "退出登陆",
                      style: TextStyle(color: color_666666, fontSize: 18),
                    ),
                  ),
                  Divider(),
            ],
          ),
        ));
  }
}

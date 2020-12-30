import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogLoginPage extends StatefulWidget {
  @override
  _BlogLoginPageState createState() => _BlogLoginPageState();
}

class _BlogLoginPageState extends State<BlogLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
        CachedNetworkImage(
          imageUrl:
              "http://pic.netbian.com/uploads/allimg/201222/001204-1608567124c15d.jpg",
          fit: BoxFit.cover,
          width: 300,
        ),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(child: Text(" "), width: 360, height: 240),
              ),
            ),
          ),
        ),
        Positioned(
            left: 30,
            top: 30,
            child: GestureDetector(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            )),
        Center(
            child: Container(
          width: 360,
          height: 200,
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或者邮箱",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )),
              TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "你的登录密码",
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Text("注册",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline)),
                  ),
                  GestureDetector(
                    child: Text("忘记密码",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: null,
                child: Container(
                  width: 240,
                  child: Text(
                    "登录",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20,),
                  ),
                ),
              )
            ],
          ),
        ))
      ]),
    );
  }
}

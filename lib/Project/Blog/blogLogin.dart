import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogLoginPage extends StatefulWidget {
  @override
  _BlogLoginPageState createState() => _BlogLoginPageState();
}

class _BlogLoginPageState extends State<BlogLoginPage> {
  @override
  int loginType = 0; //0 登录 1 注册 2 找加密码
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

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
                child: Container(child: Text(" "), width: 360, height:  400),
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
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            )),
           getWidget(),

      ]),
    );
  }

  Widget getWidget() {
    switch (loginType) {
      case 1:
        return buildRegisterView();
      case 2:
        return buildForgetPassword();
      default:
        return buildLoginView();
    }
  }

void login() {
  
}

  Widget buildLoginView() {
    return Center(
        child: Container(
      width: 360,
      height: 240,
      child: Column(
        children: [
          TextField(
            controller: userNameController,
            decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户名或者邮箱",
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )),
          TextField(
            controller: passwordController,
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
                onTap: (){
                  setState(() {
                    loginType = 1;
                  });
                },
                child: Text("注册",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline)),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    loginType = 2;
                  });
                },
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
            onPressed: (){
              login();
            },
            child: Container(
              width: 240,
              child: Text(
                "登录",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget buildRegisterView() {
    return Center(
        child: Container(
      width: 360,
      height: 400,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text("注册ZOE Blog账号",style: TextStyle(fontSize: 28,color: Colors.white),),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(
            labelText: "你的呢称",
            hintText: "请输入呢称，注册后可随时修改",
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )),
          TextField(
            decoration: InputDecoration(
              labelText: "你的邮箱",
              hintText: "你注册和找回密码使用的邮箱",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
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
          TextField(
            decoration: InputDecoration(
              labelText: "密码确认",
              hintText: "请再次输入一至密码",
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
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: null,
            child: Container(
              width: 240,
              child: Text(
                "注册",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    loginType = 0;
                  });
                },
                child: Text("返回登录",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline)),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    loginType = 2;
                  });
                },
                child: Text("忘记密码",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget buildForgetPassword() {
    return Center(
        child: Container(
      width: 360,
      height: 450,
      child: Column(
        children: [
          Text("重设密码",style: TextStyle(fontSize: 28,color: Colors.white)),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(
            labelText: "你的邮箱",
            hintText: "请输入你的邮箱用于获取重设码",
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(child: Text("输入你的注册邮箱后点击发送重设码,系统会发送一封邮件到你填写的邮箱里 ,你可以用邮件里的重设码来重设你的密码"),
              width: 200,
              ),
              RaisedButton(
            onPressed: null,
            child: Container(
              width: 100,
              child: Text(
                "发送重设码",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
            ],
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "你的邮箱",
              hintText: "你注册和找回密码使用的邮箱",
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ),
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
          TextField(
            decoration: InputDecoration(
              labelText: "密码确认",
              hintText: "请再次输入一至密码",
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
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: null,
            child: Container(
              width: 240,
              child: Text(
                "提交",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    loginType = 0;
                  });
                },
                child: Text("返回登录",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline)),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    loginType = 1;
                  });
                },
                child: Text("去注册",
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

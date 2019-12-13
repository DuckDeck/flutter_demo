import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:dio/dio.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var html_string = """
    <!--For a much more extensive example, look at example/main.dart-->
    <div>
      <h1>Demo Page</h1>
      <p>This is a fantastic nonexistent product that you should buy!</p>
      <h2>Pricing</h2>
      <p>Lorem ipsum <b>dolor</b> sit amet.</p>
      <h2>The Team</h2>
      <p>There isn't <i>really</i> a team...</p>
      <h2>Installation</h2>
      <p>You <u>cannot</u> install a nonexistent product!</p>
      <!--You can pretty much put any html in here!-->
    </div>
  """;

  @override
    void initState() {
    // TODO: implement initState
    super.initState();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录页面"),),
      body: Container(child: Html(data: html_string,),),
    );
  }

  goto_login_page(){
    
  }

// http://pic.netbian.com/e/memberconnect/?apptype=qq
}
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:dio/dio.dart';
import 'package:gbk2utf8/gbk2utf8.dart';
import 'package:html/dom.dart' as html;
import 'package:html/parser.dart';
import 'package:webview_flutter/webview_flutter.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var html_string = """
    <!--For a much more extensive example, look at example/main.dart-->
    <div>
      <h1>感觉这个功能不一定能做出来</h1>
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
    super.initState();
    getLoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录页面"),),
      // body: Container(child: Html(data: html_string,),),
      body: Container(child: WebView(
        initialUrl: "http://pic.netbian.com/e/memberconnect/?apptype=qq", //还是有问题
        javascriptMode: JavascriptMode.unrestricted,
        
      )),
    );
  }

  getLoginPage() async{
     Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    Response<List<int>> res = await dio.get<List<int>>("http://pic.netbian.com/e/memberconnect/?apptype=qq");
    final result = decodeGbk(res.data);

    html.Document dom = parse(result);
    final loginUrl = dom.body.children.first.text;
    final aa = loginUrl.substring(20,loginUrl.length - 3);
    print(aa);
    dio.options.responseType = ResponseType.plain;
    final resString = await dio.get<String>(aa);
    setState(() {
      html_string = resString.data;
    });
  }

// http://pic.netbian.com/e/memberconnect/?apptype=qq
}
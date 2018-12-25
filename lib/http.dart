import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';

class HttpRoute extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => new _HttpRouteState();
}

class _HttpRouteState extends State<HttpRoute>{

bool _loading = false;
String _text = "";
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text("获取某网站首页"),
            onPressed: _loading ? null : () async {
              setState(() {
                _loading = true;
                _text = "正在请求";
              });
              try {
                HttpClient httpClient = new HttpClient();
                HttpClientRequest req = await httpClient.getUrl(Uri.parse("http://zhannei.baidu.com/cse/search"));
                req.headers.add("user-agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36");
                HttpClientResponse response = await req.close();
                _text = await response.transform(utf8.decoder).join();
                print(response.headers);
                httpClient.close();
              }catch(e){
                _text = "请求失败";
              }finally{
                setState(() {
                    _loading = false;
                  });
              } 
                 
            },),
            Container(width: MediaQuery.of(context).size.width - 50,child: Text(_text.replaceAll(new RegExp(r"\s"),  "")))
          ],
        ),
      ),
    );
  }

}
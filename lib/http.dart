import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';

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
                Dio dio = new Dio();
                Response<String> response=await dio.get("http://zhannei.baidu.com/cse/search",
                data: {'q':'星辰变','p':0,'isNeedCheckDomain':1,'jump':1,'s':'2041213923836881982'});
                
                _text =  response.data;
                var docu = parse(_text);
                
                
       
                
              }catch(e){
                print(e.toString());
                _text = "请求失败";
              }finally{
                setState(() {
                    _loading = false;
                  });
              } 
                 
            },),
            Container(width: MediaQuery.of(context).size.width - 50,color: Colors.white,
            child: Text(_text.replaceAll(new RegExp(r"\s"),  ""),style: TextStyle(fontSize: 14.0),))
          ],
        ),
      ),
    );
  }

}


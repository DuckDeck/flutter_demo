import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/articleTagsView.dart';
import 'package:flutter_demo/Project/Blog/UI/articleUserInfo.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArtcilDetailPage extends StatefulWidget {
  @override
  _ArtcilDetailPageState createState() => _ArtcilDetailPageState();
}

class _ArtcilDetailPageState extends State<ArtcilDetailPage> {
  

  ArticleInfo info;

  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context).settings.arguments;
  
    print(info.id);
    return Scaffold(
      appBar: AppBar(
        title: Text("文章详情"),
      ),
      body: FutureBuilder<ArticleInfo>(
        future: _getData(),
        // ignore: missing_return
        builder:(BuildContext context, AsyncSnapshot<ArticleInfo> snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.active:
              return Center(child: CircularProgressIndicator(),);
              case ConnectionState.none:
              return Text("加载失败");
              case ConnectionState.done:
              return ListView(
                children: [
                  Container(margin: EdgeInsets.all(10),child: Text(snapshot.data.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ArticleUserInfoView(articleInfo: snapshot.data,),
                  SizedBox(height: 10,),
                  ArticleTagsView(tags: snapshot.data.tags,),
                  SizedBox(height: 10,),
                  Html(data: snapshot.data.content),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.favorite),
                                SizedBox(width: 8,),
                                Text("喜欢"),
                                SizedBox(width: 8,),
                                Divider(height: 10,indent: 1,),
                                SizedBox(width: 8,),
                                Text(snapshot.data.likeCount.toString())
                              ],
                            ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.star),
                                SizedBox(width: 8,),
                                Text("收藏"),
                                SizedBox(width: 8,),
                                Divider(height: 10,indent: 1,),
                                SizedBox(width: 8,),
                                Text(snapshot.data.collectCount.toString())
                              ],
                            ),
                        ),
                      )
                    ],
                  ),

                  Container(
                    child: Row(
                      children: [
                        FlatButton(onPressed: null, child: Text("登录")),
                        Text("且发表评论")
                      ]
                    ),
                  ),
                
                  Text("${snapshot.data.commentCount}条评论")
                
                ],
              );
            }
        }),
    );
  }



  Future<ArticleInfo> _getData() async {
    
    final res = await  ArticleInfo.articleInfo(info.id);
     if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return null;
    }
    
    final article = res.data as ArticleInfo;
    
    print(article.title);
    return res.data as ArticleInfo;
  }
}
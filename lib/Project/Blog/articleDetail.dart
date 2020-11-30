import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/CommentInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/articleTagsView.dart';
import 'package:flutter_demo/Project/Blog/UI/articleUserInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/commentCell.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
class ArticleDetailPage extends StatefulWidget {
  ArticleInfo info;
  ArticleDetailPage({this.info});
  @override
  _ArticleDetailPagePageState createState() => _ArticleDetailPagePageState();
}

class _ArticleDetailPagePageState extends State<ArticleDetailPage> {
  ArticleInfo info;
  List<CommentInfo> comments = List<CommentInfo>();
  var _isLoading = false;
  var _isInit = true;
  @override
  void initState() { 
    info = widget.info;
    super.initState();
    _getData();
    _getComment();
  }


  @override
  Widget build(BuildContext context) {
     
  

    return Scaffold(
      appBar: AppBar(
        title: Text(info.title),
      ),
      body: ListView(children: [
         Container(margin: EdgeInsets.all(10),child: Text(info.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ArticleUserInfoView(articleInfo: info,),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4,horizontal: 15),
                    child: ArticleTagsView(tags: info.tags,)),
                  SizedBox(height: 10,),

                  _isInit  ? SkeletonLoader(builder: Container(
                    padding:EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Container(
                          width: double.infinity,
                          height: 12,
                          color: Colors.white,
                      )

                  ),
                  items: 20,
                  period: Duration(seconds: 2),
                  
                   direction: SkeletonDirection.ltr,
                  ) : Html(data: info.content),
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
                                Text(info.likeCount.toString())
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
                                Text(info.collectCount.toString())
                              ],
                            ),
                        ),
                      )
                    ],
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(onPressed: null, child: Text("登录")),
                        Text("且发表评论")
                      ]
                    ),
                  ),
                
                  Text("${info.commentCount}条评论"),
                  Column(children: comments.map((e) => CommentCell(commentInfo:e)).toList(),)
      ],)
    );
  }



  void _getData() async {
    final res = await  ArticleInfo.articleInfo(info.id);
     if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return null;
    }
    final article = res.data as ArticleInfo;
    setState(() {
      _isInit = false;
      info =  article;
    });
     
  }

  void _getComment() async{
    final res = await CommentInfo.getComments(info.id, 0);
    if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return null;
    }
    setState(() {
      comments = res.data as List<CommentInfo>;
    });
    
  }
}
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/CommentInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/articleTagsView.dart';
import 'package:flutter_demo/Project/Blog/UI/articleUserInfo.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
class ArtcilDetailPage extends StatefulWidget {
    ArticleInfo info;
    ArtcilDetailPage({this.info});
  @override
  _ArtcilDetailPageState createState() => _ArtcilDetailPageState();
}

class _ArtcilDetailPageState extends State<ArtcilDetailPage> {

  List<CommentInfo> comments = List<CommentInfo>();
  var _isLoading = false;
  var _isInit = true;
  @override
  void initState() { 
    
     print("~~~~~~~~~~~~~~~~~~~~~~");
    super.initState();
    _getData();
    _getComment();
  }


  @override
  Widget build(BuildContext context) {
     print("~~~~~~~~~~~~~~~~~~~~~~");
     print(widget.info);
  

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.info.title),
      ),
      body: ListView(children: [
         Container(margin: EdgeInsets.all(10),child: Text(widget.info.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ArticleUserInfoView(articleInfo: widget.info,),
                  SizedBox(height: 10,),
                  ArticleTagsView(tags: widget.info.tags,),
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
                  ) : Html(data: widget.info.content),
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
                                Text(widget.info.likeCount.toString())
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
                                Text(widget.info.collectCount.toString())
                              ],
                            ),
                        ),
                      )
                    ],
                  ),

                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlatButton(onPressed: null, child: Text("登录")),
                        Text("且发表评论")
                      ]
                    ),
                  ),
                
                  Text("${widget.info.commentCount}条评论")
      ],)
    );
  }



  void _getData() async {
    
    final res = await  ArticleInfo.articleInfo(widget.info.id);
     if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return null;
    }
    
    final article = res.data as ArticleInfo;
    print("~~~~~~~~~~~~~~~~~~~~~~");
    print(article.content);
    setState(() {
      _isInit = false;
      widget.info =  article;
    });
     
  }

  Future<List<CommentInfo>> _getComment() async{
    final res = await CommentInfo.getComments(widget.info.id, 0);

  }
}
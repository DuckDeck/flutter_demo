import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/CommentInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/articleTagsView.dart';
import 'package:flutter_demo/Project/Blog/UI/articleUserInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/collectClickView.dart';
import 'package:flutter_demo/Project/Blog/UI/commentCell.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
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
     print("targetUserId${widget.info}");
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
        body: Container(
          padding: EdgeInsets.all(5),
            child: ListView(
          children: [
               info.userInfo == null ? SkeletonLoader(
                    builder: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 12,
                          color: Colors.white,
                        )),
                    items: 2,
                    period: Duration(seconds: 2),
                    direction: SkeletonDirection.ltr,
                  ) : 
            ArticleUserInfoView(
              articleInfo: info,
            ),
            SizedBox(
              height: 10,
            ),
            info.tags == null ? SizedBox(height: 1,) : Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                child: ArticleTagsView(
                  tags: info.tags,
                )), 
            SizedBox(
              height: 10,
            ),
            _isInit
                ? SkeletonLoader(
                    builder: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 12,
                          color: Colors.white,
                        )),
                    items: 20,
                    period: Duration(seconds: 2),
                    direction: SkeletonDirection.ltr,
                  )
                : Html(data: info.content),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CollectClickView(icon: Icons.favorite, isSelect: false,title: "喜欢", num: info.likeCount,),
                CollectClickView(icon: Icons.star,isSelect: false,title: "收藏", num: info.collectCount,)
              ],
            ),
            SizedBox(height: 10,),
            Container(
              child: currentUser == null ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(onPressed: ()=> { Navigator.of(context).pushNamed("/project/blog/login")}
                    , child: Text("登录")),
                    Text("且发表评论")
                  ]) : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(labelText: "你想写的评论",border: OutlineInputBorder(borderSide: BorderSide(width: 1,color: color_999999)) ),
                      ),
                      FlatButton(onPressed: null, child: Text("提交"))
                    ],
                  )
            ),
            SizedBox(height: 10,),
            Text("${info.commentCount ?? 0}条评论"),
            SizedBox(height: 5),
            Column(
              children:
                  comments.map((e) => CommentCell(commentInfo: e)).toList(),
            )
          ],
        )));
  }

  void _getData() async {
    final res = await ArticleInfo.articleInfo(info.id);
    if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return null;
    }
    final article = res.data as ArticleInfo;
    article.commentCount = info.commentCount;
    setState(() {
      _isInit = false;
      info = article;
    });
  }

  void _getComment() async {
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

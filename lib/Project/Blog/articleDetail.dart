import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/CommentInfo.dart';
import 'package:flutter_demo/Project/Blog/Tool/NotificationCenter.dart';
import 'package:flutter_demo/Project/Blog/UI/articleTagsView.dart';
import 'package:flutter_demo/Project/Blog/UI/articleUserInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/collectClickView.dart';
import 'package:flutter_demo/Project/Blog/UI/commentCell.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/ResultInfo.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  final commentTextController = TextEditingController();
  final subCommentTextController = TextEditingController();
  FocusNode _commentFocus = FocusNode();
  var _isLoading = false;
  var _isInit = true;
  @override
  void initState() {
    print("targetUserId${widget.info}");
    info = widget.info;
    super.initState();
    _getData();
    _getComment();
    NotifcationCenter.instance.addObserver(loginNotif, (object) {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(info.title),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            // 触摸收起键盘
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  info.userInfo == null
                      ? SkeletonLoader(
                          builder: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Container(
                                width: double.infinity,
                                height: 12,
                                color: Colors.white,
                              )),
                          items: 2,
                          period: Duration(seconds: 2),
                          direction: SkeletonDirection.ltr,
                        )
                      : ArticleUserInfoView(
                          articleInfo: info,
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  info.tags == null
                      ? SizedBox(
                          height: 1,
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                          child: ArticleTagsView(
                            tags: info.tags,
                          )),
                  SizedBox(
                    height: 10,
                  ),
                  _isInit
                      ? SkeletonLoader(
                          builder: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CollectClickView(
                        icon: Icons.favorite,
                        isSelect: info.isUserLike ?? false,
                        title: "喜欢",
                        num: info.likeCount,
                        collectClick: (title, isSelect) {
                          ArticleInfo.userLikeArticle(
                                  info.id, (isSelect as bool))
                              .then((value) => {updateLike(value)});
                        },
                      ),
                      CollectClickView(
                        icon: Icons.star,
                        isSelect: info.isUserCollect ?? false,
                        title: "收藏",
                        num: info.collectCount,
                        collectClick: (title, isSelect) {
                          ArticleInfo.userCollectArticle(
                                  info.id, (isSelect as bool))
                              .then((value) => {updateCollect(value)});
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: currentUser == null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  FlatButton(
                                      onPressed: () => {
                                            Navigator.of(context).pushNamed(
                                                "/project/blog/login")
                                          },
                                      child: Text("登录")),
                                  Text("且发表评论")
                                ])
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextField(
                                  focusNode: _commentFocus,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  controller: commentTextController,
                                  decoration: InputDecoration(
                                      hintText: "你想写的评论",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: color_999999))),
                                ),
                                FlatButton(
                                    onPressed: addComment,
                                    child: Text(
                                      "提交",
                                      style: TextStyle(color: Colors.purple),
                                    ))
                              ],
                            )),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${info.commentCount ?? 0}条评论"),
                  SizedBox(height: 15),
                  Column(
                    children: comments
                        .map((e) => CommentCell(
                              commentInfo: e,
                              addSubComent: (comment) {
                                showSubCommentDialog(comment);
                              },
                            ))
                        .toList(),
                  )
                ],
              )),
        ));
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

  void updateLike(ResultInfo res) {
    if (res.code == 0) {
      setState(() {
        info.isUserLike = !info.isUserLike;
        if (info.isUserLike) {
          info.likeCount += 1;
        } else {
          info.likeCount -= 1;
        }
      });
    } else {
      Fluttertoast.showToast(msg: res.msg);
    }
  }

  void updateCollect(ResultInfo res) {
    if (res.code == 0) {
      setState(() {
        info.isUserCollect = !info.isUserCollect;
        if (info.isUserCollect) {
          info.collectCount += 1;
        } else {
          info.collectCount -= 1;
        }
      });
    } else {
      Fluttertoast.showToast(msg: res.msg);
    }
  }

  void addComment() async {
    if (commentTextController.text.length <= 0) {
      Fluttertoast.showToast(msg: "评论不能为空");
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    _commentFocus.unfocus();
    EasyLoading.show();
    final data = {
      "commentTargetId": info.id.toString(),
      "commentContent": commentTextController.text
    };
    final res = await CommentInfo.addComment(data);
    if (res.code != 0) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: res.msg);
      return;
    }
    commentTextController.text = "";

    _getComment();
  }

  void showSubCommentDialog(CommentInfo mainComment) async {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("添加评论"),
            content: Card(
              elevation: 0.0,
              child: Container(
                  child: TextField(
                controller: subCommentTextController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                style: TextStyle(fontSize: 11),
                decoration: InputDecoration(
                    hintText: "你对${mainComment.userInfo.realName}评论的回应",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: color_999999))),
              )),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('取消'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  addSubDialog(mainComment);
                  Navigator.pop(context);
                },
                child: Text('确定'),
              ),
            ],
          );
        });
  }

  void addSubDialog(CommentInfo mainComment) async {
    final data = {
      "commentTargetId": mainComment.id.toString(),
      "commentContent": subCommentTextController.text,
      "commentTargetUserId": mainComment.userInfo.id.toString(),
      "commentScope": mainComment.id.toString(),
      "commentType": "0"
    };
    EasyLoading.show();
    final res = await CommentInfo.addComment(data);
    if (res.code != 0) {
      EasyLoading.dismiss();
      Fluttertoast.showToast(msg: res.msg);
      return;
    }
    subCommentTextController.text = "";
    _getComment();
  }

  void _getComment() async {
    final res = await CommentInfo.getComments(info.id, 0);
    EasyLoading.dismiss();
    if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return null;
    }
    setState(() {
      comments = res.data as List<CommentInfo>;
    });
  }
}

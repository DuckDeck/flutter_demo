import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class UserInfoPage extends StatefulWidget {
  UserInfo userInfo;
  UserInfo targetUserInfo;
  UserInfoPage({this.targetUserInfo});
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.userInfo = currentUser.copyUser();
    print("targetUserId${widget.targetUserInfo}");
    this.getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我"),
      ),
      body: Container(
        color: color_f0f0f0,
        child: Column(
          children: [
            Container(
              height: 90,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 20,
                    child: ClipOval(
                      child: CachedNetworkImage(
                          imageUrl: widget.userInfo.headImage,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Image.asset("Images/placeholder_head.jpg")),
                    ),
                  ),
                  Positioned(
                    left: 87,
                    top: 20,
                    child: Text(
                      widget.userInfo.realName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    left: 87,
                    top: 50,
                    child: widget.userInfo.userLikedArticleCount == null
                        ? SkeletonLoader(
                            builder: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Container(
                                  width: double.infinity,
                                  height: 12,
                                  color: Colors.white,
                                )),
                            items: 1,
                            period: Duration(seconds: 2),
                            direction: SkeletonDirection.ltr,
                          )
                        : Text(
                            "发布的文章${widget.userInfo.articleCount} 收获的喜欢${widget.userInfo.userLikedArticleCount}",
                            style: TextStyle(fontSize: 16, color: color_999999),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              width: 500,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    child: Text(
                      "我的文章",
                      style: TextStyle(color: color_666666, fontSize: 18),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: color_e0e0e0,
                  ),
                  FlatButton(
                      child: Text(
                    "我的动态",
                    style: TextStyle(color: color_666666, fontSize: 18),
                  )),
                  Divider(
                    height: 1,
                    color: color_e0e0e0,
                  ),
                  FlatButton(
                    child: Text(
                      "我的评论",
                      style: TextStyle(color: color_666666, fontSize: 18),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: color_e0e0e0,
                  ),
                  FlatButton(
                    child: Text(
                      "我喜欢的文章",
                      style: TextStyle(color: color_666666, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 500,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.white,
              child: Text(
                "作者个人介绍",
                textAlign: TextAlign.left,
                style: TextStyle(color: color_333333, fontSize: 20),
              ),
            ),
            Divider(
              height: 1,
              color: color_e0e0e0,
            ),
            Container(
              width: 500,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.white,
              child: widget.userInfo.says == null
                  ? SkeletonLoader(
                      builder: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            width: double.infinity,
                            height: 12,
                            color: Colors.white,
                          )),
                      items: 1,
                      period: Duration(seconds: 2),
                      direction: SkeletonDirection.ltr,
                    )
                  : Text(
                      widget.userInfo.says,
                      style: TextStyle(color: color_666666),
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              width: 500,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                "我的链接",
                textAlign: TextAlign.left,
                style: TextStyle(color: color_333333, fontSize: 20),
              ),
            ),
            Divider(
              height: 1,
              color: color_e0e0e0,
            ),
            Container(
              width: 500,
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: (widget.userInfo.links != null && widget.userInfo.links.length > 0)
                ? 
                     Wrap(
                      children: createWebsites(),
                    )
                   
                  
                : SkeletonLoader(
                    builder: Container(
                      
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 12,
                          color: Colors.white,
                        )),
                    items: 1,
                    period: Duration(seconds: 2),
                    direction: SkeletonDirection.ltr,
                  ),)
            
          ],
        ),
      ),
    );
  }

  List<Widget> createWebsites() {
    final links = widget.userInfo.links.map((e) {
      return OutlineButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Text(e.url),
      );
    }).toList();
    return links;
  }

  void getUserDetail() async {
    final res = await UserInfo.getUseiInfo(
        widget.targetUserInfo == null ? 0 : widget.targetUserInfo.id,
        widget.userInfo.id);
    if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return;
    }

    setState(() {
      widget.userInfo = res.data as UserInfo;
    });
  }
}

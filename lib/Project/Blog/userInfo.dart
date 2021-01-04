import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:flutter_demo/Project/Blog/config.dart';

class UserInfoPage extends StatefulWidget {
  UserInfo userInfo;
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.userInfo = currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我"),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              height: 100,
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
                    top: 25,
                    child: Text(widget.userInfo.realName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                   Positioned(
                    left: 87,
                    top: 55,
                    child: Text("发布的文章${widget.userInfo.articleCount} 收获的喜欢${widget.userInfo}",style: TextStyle(fontSize: 14,color: color_999999),),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

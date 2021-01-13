import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/MessageInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/RefreshAndLoadMore.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyMessagePage extends StatefulWidget {
  @override
  _MyMessagePageState createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage>
    with SingleTickerProviderStateMixin {
     RefreshController rc1 = RefreshController(initialRefresh: true);
  var currentType = 1;
  var messageIndex = [0, 0, 0, 0];
  TabController _tabController;
  var commentList = List<MessageInfo>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (currentType != _tabController.index + 1) {
          currentType = _tabController.index + 1;
        }
      });
      this.getMessage();
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("我的消息"),
            bottom: TabBar(controller: _tabController, tabs: [
              Tab(
                icon: Icon(
                  Icons.comment,
                  size: 30,
                ),
                text: "评论",
              ),
              Tab(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                text: "喜欢和赞",
              ),
              Tab(
                icon: Icon(
                  Icons.beach_access,
                  size: 30,
                ),
                text: "关注",
              ),
              Tab(
                icon: Icon(
                  Icons.message,
                  size: 30,
                ),
                text: "私信",
              ),
            ]),
          ),
          body: TabBarView(children: [
            RefreshAndLoadMore(
              controller: rc1,
              loadMoreFun: loadMore,

            ),
            Text("data"),
            Text("data"),
            Text("data"),
          ]),
        ));
  }

  void loadMore(){
    messageIndex[currentType] += 1;
    this.getMessage();
  }

    List<Widget> buildList() {
    var widgets = List<Widget>();
      return widgets;
    }

  void getMessage() async {
      final res = await MessageInfo.getMessage(
          currentUser.id, currentType, messageIndex[currentType]);
      if (res.code != 0) {
        Fluttertoast.showToast(msg: res.msg);
        return;
      }
    }
}


class CommentMessageCell extends StatelessWidget {
  final MessageInfo messageInfo;
  CommentMessageCell({this.messageInfo});
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(children: [
        Row(
          children: [
            ClipOval(
                child: CachedNetworkImage(
                    imageUrl: messageInfo.userInfo.headImage,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Image.asset("Images/placeholder_head.jpg")),
              ),
              Container(
                child: Text(
                  messageInfo.userInfo.realName,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
              ),
          ],
        ),
        Text(messageInfo.extraInfo["content"])
      ],),
    );
  }
}
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
    with SingleTickerProviderStateMixin ,AutomaticKeepAliveClientMixin{
  RefreshController rc1 = RefreshController(initialRefresh: true);
  RefreshController rc2 = RefreshController(initialRefresh: true);
  @override
  bool get wantKeepAlive => true;
  var currentType = 1;
  var messageIndex = [0, 0, 0, 0];
  TabController _tabController;
  var commentList = List<MessageInfo>();
  var likeList = List<MessageInfo>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (currentType != _tabController.index + 1) {
          currentType = _tabController.index + 1;
        }
      });
    // this.getMessage();
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
          body: TabBarView(
            controller: _tabController,
            children: [
            RefreshAndLoadMore(
              controller: rc1,
              refreshFun: getMessage,
              loadMoreFun: loadMore,
              children: buildList(1),
            ),
            RefreshAndLoadMore(
              controller: rc2,
              refreshFun: getMessage,
              loadMoreFun: loadMore,
              children: buildList(2),
            ),
            Text("data"),
            Text("data"),
          ]),
        ));
  }

  void loadMore() {
    messageIndex[currentType] += 1;
    this.getMessage();
  }

  List<Widget> buildList(int type) {
    var widgets = List<Widget>();
    switch (type) {
      case 1:
        for (var item in commentList) {
          final cell = CommentMessageCell(item);
          widgets.add(cell);
        }
        break;
      case 2:
        for (var item in likeList) {
          final cell = CommentMessageCell(item);
          widgets.add(cell);
        }
        break;

      default:
    }
    return widgets;
  }

  void getMessage() async {
    print("获取信息${currentType.toString()}");
    final res = await MessageInfo.getMessage(
        currentUser.id, currentType, messageIndex[currentType]);
    if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return;
    }
    rc1.refreshCompleted();
    rc1.loadComplete();
    if (currentType == 1) {
      setState(() {
        commentList = res.data as List<MessageInfo>;
      });
    }
    if (currentType == 2) {
      setState(() {
        likeList = res.data as List<MessageInfo>;
      });
    }
  }
}

class CommentMessageCell extends StatelessWidget {
  MessageInfo messageInfo;
  CommentMessageCell(this.messageInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
              ),
              SizedBox(
                width: 8,
              ),
              Text("评论了你的文章:"),
            ],
          ),
          Text(
            messageInfo.extraInfo["comment_project_title"],
            style: TextStyle(color: Colors.blue),
            textAlign: TextAlign.left,
          ),
          Text(messageInfo.extraInfo["content"], textAlign: TextAlign.left)
        ],
      ),
    );
  }
}

class LikeMessageCell extends StatelessWidget {
  MessageInfo messageInfo;
  LikeMessageCell(this.messageInfo);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
          ),
          SizedBox(
            width: 8,
          ),
          Text("评论了你的文章:"),
          Text(
            messageInfo.extraInfo["comment_project_title"],
            style: TextStyle(color: Colors.blue),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

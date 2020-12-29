import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/RefreshAndLoadMore.dart';
import 'package:flutter_demo/Project/Blog/UI/articleCell.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'searchContent.dart';

class ZoeBlogPage extends StatefulWidget {
  @override
  _ZoeBlogPageState createState() => _ZoeBlogPageState();
}

class _ZoeBlogPageState extends State<ZoeBlogPage> {
  List<ArticleInfo> banners;
  List<ArticleInfo> articles;

  RefreshController rc = RefreshController(initialRefresh: true);
  var index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    banners = List<ArticleInfo>();
    articles = List<ArticleInfo>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ZOE Blog"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: gotoSearch)
        ],
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
      ),
      drawer: LeftMenu(),
      body: Container(
          child: RefreshAndLoadMore(
              controller: rc,
              refreshFun: initData,
              loadMoreFun: loadMore,
              children: buildList())),
    );
  }

  void initData() async {
    final result = await ArticleInfo.indexPage(index);
    rc.refreshCompleted();
    if (result.code != 0) {
      Fluttertoast.showToast(msg: result.msg);
      return;
    }
    final homeData = result.data as Map<String, dynamic>;
    print(homeData);
    setState(() {
      banners = homeData["banners"];
      articles = homeData["articles"];
    });
  }

  void loadMore() async {
    index += 1;
    final result = await ArticleInfo.indexPage(index);
    rc.loadComplete();
    if (result.code != 0) {
      Fluttertoast.showToast(msg: result.msg);
      return;
    }
    final data = result.data as List<ArticleInfo>;
    if (data.length <= 0) {
      rc.loadNoData();
      return;
    }
    setState(() {
      articles.addAll(data);
    });
  }

  List<Widget> buildList() {
    var widgets = List<Widget>();
    widgets.add(SizedBox(
      child: new Swiper(
        autoplay: true,
        itemCount: banners.length,
        pagination: new SwiperPagination(),
        onTap: (int index) {
          Navigator.of(context)
              .pushNamed("/project/blog/article", arguments: banners[index]);
        },
        itemBuilder: (BuildContext context, int bannerIndex) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: banners[bannerIndex].mainImage,
                fit: BoxFit.cover,
              ),
              DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                Colors.white.withAlpha(0),
                Colors.grey.withAlpha(100)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
              Positioned(
                child: Text(
                  banners[bannerIndex].title,
                  style: TextStyle(color: Colors.grey[100]),
                ),
                bottom: 30,
              )
            ],
          );
        },
      ),
      height: 200,
    ));
    widgets.addAll(articles.map((e) => ArticleCell(articleInfo: e)).toList());
    return widgets;
  }

  void gotoSearch() {
    showSearch(context: context, delegate: SearchBarDelegate());
  }
}

class LeftMenu extends StatelessWidget {
  LeftMenu({
    UserInfo userinfo,
    Key key,
  }) : super(key: key);
  UserInfo userInfo;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: [
                  GestureDetector(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: "http://bqbbq.com/static/img/zoe_logo.jpg",
                          fit: BoxFit.cover,
                          width: 300,
                        ),
                        Center(
                          child: ClipRect(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Opacity(
                                opacity: 0.5,
                                child: Container(
                                    child: Text(" "), width: 300, height: 200),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          child: ClipOval(
                            child: CachedNetworkImage(
                                imageUrl:
                                    userInfo == null ? "" : userInfo.headImage,
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Image.asset("Images/placeholder_head.jpg")),
                          ),
                        ),
                        Positioned(
                            left: 100,
                            child: Text(
                              "未登录",
                              style: TextStyle(fontSize: 25),
                            )),
                      ],
                    ),
                    onTap: ()=>gotoUser(context),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("Add Count"),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("系统设置"),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  void gotoUser(BuildContext context) {
    if(currentUser == null){
            Navigator.of(context).pushNamed("/project/blog/login");
    }
    else{

    }
  }
}

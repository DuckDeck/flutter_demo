import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/articleCell.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZoeBlogPage extends StatefulWidget {
  @override
  _ZoeBlogPageState createState() => _ZoeBlogPageState();
}

class _ZoeBlogPageState extends State<ZoeBlogPage> {
  List<ArticleInfo> banners;
  List<ArticleInfo> articles;
  var index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    banners = List<ArticleInfo>();
    articles = List<ArticleInfo>();
    initData();
    print(initData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ZOE Blog"),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
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
          child: ListView.builder(
              itemCount: articles.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(
                    child: new Swiper(
                      itemCount: banners.length,
                      pagination: new SwiperPagination(),
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
                                    gradient: LinearGradient(
                                        colors: [
                                  Colors.white.withAlpha(0),
                                  Colors.grey.withAlpha(100)
                                ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter))),
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
                  );
                } else {
                  return ArticleCell(
                    articleInfo: articles[index - 1],
                  );
                }
              })),
    );
  }

  void initData() async {
    EasyLoading.show(status: "加载中");
    final result = await ArticleInfo.indexPage(index);
    EasyLoading.dismiss();
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
}

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    Key key,
  }) : super(key: key);

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Image.asset(
                      "Images/1.jpg",
                      width: 80,
                    ),
                  ),
                  Text(
                    "data",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                  title: const Text("Manage Account"),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

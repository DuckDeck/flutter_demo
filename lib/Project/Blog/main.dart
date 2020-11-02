import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZoeBlogPage extends StatefulWidget {
  @override
  _ZoeBlogPageState createState() => _ZoeBlogPageState();
}

class _ZoeBlogPageState extends State<ZoeBlogPage> {

  List<ArticleInfo> banners;
  List<ArticleInfo> articles;

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
        body: Container(child:
          Column(children: [
            SizedBox(child: new Swiper(itemCount: 3,pagination: new SwiperPagination(),
              itemBuilder: (BuildContext context,int index){
                return CachedNetworkImage(imageUrl: "https://img.3dmgame.com/uploads/images2/news/20201030/1604028144_924041.jpg",);
              },
            ), height: 300,),
            Expanded(child: ListView.builder(itemBuilder: (BuildContext context, int index) {
              

            }))
          ],)
        ,),
    
    );
  }

  void initData() {
    ArticleInfo.indexPage().then((value) => 
        
          
        setState(() {
          

          //articles = value.data as [String,dynamic]
      })
    );

  
  }
}


class ArticleCell extends StatelessWidget {
  final ArticleInfo articleInfo;
  ArticleCell({this.articleInfo});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(articleInfo.brief),
        CachedNetworkImage(imageUrl: articleInfo.mainImage,)
      ],),
    );
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

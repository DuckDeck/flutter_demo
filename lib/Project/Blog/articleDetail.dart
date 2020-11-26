import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/articleUserInfo.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ArtcilDetailPage extends StatefulWidget {
  @override
  _ArtcilDetailPageState createState() => _ArtcilDetailPageState();
}

class _ArtcilDetailPageState extends State<ArtcilDetailPage> {
  

  ArticleInfo info;

  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context).settings.arguments;

    print(info.id);
    return Scaffold(
      appBar: AppBar(
        title: Text("文章详情"),
      ),
      body: FutureBuilder<ArticleInfo>(
        future: _getData(),
        // ignore: missing_return
        builder:(BuildContext context, AsyncSnapshot<ArticleInfo> snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.active:
              return Center(child: CircularProgressIndicator(),);
              case ConnectionState.none:
              return Text("加载失败");
              case ConnectionState.done:
              return Column(
                children: [
                  Container(margin: EdgeInsets.all(10),child: Text(snapshot.data.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ArticleUserInfoView(articleInfo: snapshot.data,)
                ],
              );
            }
        }),
    );
  }

  Future<ArticleInfo> _getData() async {
    
    final res = await  ArticleInfo.articleInfo(info.id);
     if (res.code != 0) {
      Fluttertoast.showToast(msg: res.msg);
      return null;
    }
    
    final article = res.data as ArticleInfo;
    
    print(article.title);
    return res.data as ArticleInfo;
  }
}
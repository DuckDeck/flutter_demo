import 'package:flutter/material.dart';
import '../Model/ArticleInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleUserInfoView extends StatelessWidget {
  final ArticleInfo articleInfo;
  ArticleUserInfoView({this.articleInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
                imageUrl: articleInfo.userInfo.headImage,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Image.asset("Images/placeholder_head.jpg")),
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text("作者"),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 1.0)),
                  ),
                  Text(articleInfo.userInfo.realName),
                  RaisedButton.icon(
                      onPressed: null, icon: Icon(Icons.add), label: Text("关注"))
                ],
              ),
              Row(children: [
                Text("发布于${articleInfo.CreateTimeStr}"),
                SizedBox(width: 5,),
                Text("文章数${articleInfo.commentCount}"),
                SizedBox(width: 5,),
                Text("流星量${articleInfo.commentCount}"),

              ],)
            ],
          )
        ],
      ),
    );
  }
}

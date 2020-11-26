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
          SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Text("作者"),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 1.0),borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(width: 10,),
                  Text(articleInfo.userInfo.realName),
                  SizedBox(width: 10,),
                 Container(
                   width: 40,
                   height: 20,
                   
                   child: RaisedButton.icon(
                      onPressed: null, shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) , icon: Icon(Icons.add), label: Text("关注")),)
                ],
              ),
              Row(children: [
                Text("发布于${articleInfo.CreateTimeStr}"),
                SizedBox(width: 5,),
                Text("文章数${articleInfo.commentCount}"),
                SizedBox(width: 5,),
                Text("浏览量${articleInfo.commentCount}"),

              ],)
            ],
          )
        ],
      ),
    );
  }
}

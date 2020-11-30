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
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Image.asset("Images/placeholder_head.jpg")),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1,horizontal: 5),
                    child: Text("作者"),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 1.0),borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(width: 10,),
                  Text(articleInfo.userInfo.realName),
                  SizedBox(width: 10,),
                 Container(
                  padding: EdgeInsets.symmetric(vertical: 1,horizontal: 5),
                   decoration: BoxDecoration(border: Border.all(color: Colors.green,width: 1),borderRadius: BorderRadius.circular(10)),
                   child: GestureDetector(
                     child: Row(
                       children: [
                         Icon(Icons.add,size: 14,),
                         Text("关注",style: TextStyle(fontSize: 14),)
                       ],
                     )
                   ))
                ],
              ),
              Row(children: [
                Text("发布于${articleInfo.CreateTimeStr}"),
                SizedBox(width: 5,),
                articleInfo.userInfo.articleCount == null ? Text("") : Text("文章数${articleInfo.userInfo.articleCount}"),
                
                SizedBox(width: 5,),
                articleInfo.userInfo.commentCount == null ? Text("") : Text("浏览量${articleInfo.userInfo.commentCount}")
  

              ],)
            ],
          )
        ],
      ),
    );
  }
}

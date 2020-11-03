import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';

class ArticleCell extends StatelessWidget {
  final ArticleInfo articleInfo;
  ArticleCell({this.articleInfo});
  @override
  Widget build(BuildContext context) {
    print(articleInfo.title);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: articleInfo.userInfo.headImage,
              ),
              Text(articleInfo.userInfo.realName),
              Text("${articleInfo.commentCount}条评论"),
              Icon(Icons.comment),
              Text("${articleInfo.likeCount}人喜欢"),
              Icon(Icons.favorite),
            ],
          ),
          Row(
            children: [
              Container(
                  constraints: BoxConstraints.tightFor(height: 200),
                  child: Column(
                    children: [
                      Text(articleInfo.title),
                      Expanded(
                        child: Text(
                          articleInfo.brief,
                          style: TextStyle(),
                          textAlign: TextAlign.left,
                          maxLines: 4,
                        ),
                      )
                    ],
                  )),
              SizedBox(
                child: CachedNetworkImage(
                  imageUrl: articleInfo.mainImage,
                ),
                width: 200,
                height: 200,
              )
            ],
          ),
        ],
      ),
    );
  }
}

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
              ClipOval(
                child: CachedNetworkImage(
                    imageUrl: articleInfo.userInfo.headImage,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator()),
              ),

              Text(articleInfo.userInfo.realName,style: TextStyle(fontSize: 18,color: Colors.grey[10]),),
              Spacer(),
              Icon(Icons.comment),
              Text("${articleInfo.commentCount}条评论"),
              
              Icon(Icons.favorite),
              Text("${articleInfo.likeCount}人喜欢"),
            ],
          ),
          Row(
            children: [
              Container(
                  constraints: BoxConstraints.tightFor(height: 200),
                  child: Column(
                    children: [
                      // Text(articleInfo.title),
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
              // SizedBox(
              //   child: CachedNetworkImage(
              //     imageUrl: articleInfo.mainImage,
              //   ),
              //   width: 200,
              //   height: 200,
              // )
            ],
          ),
        ],
      ),
    );
  }
}

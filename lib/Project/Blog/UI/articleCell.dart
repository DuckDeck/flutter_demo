import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/UI/articleTagsView.dart';

class ArticleCell extends StatelessWidget {
  final ArticleInfo articleInfo;
  ArticleCell({this.articleInfo});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double imgSize = articleInfo.mainImage.indexOf("http") < 0 ? 0 : 100;
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              Container(
                child: Text(
                  articleInfo.userInfo.realName,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.fromLTRB(6, 0, 0, 0),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.comment),
              Text("${articleInfo.commentCount}条评论"),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.favorite),
              Text("${articleInfo.likeCount}人喜欢"),
              Spacer(),
              Text("${articleInfo.CreateTimeStr}"),
            ],
          ),
          SizedBox(height:5 ),
          GestureDetector(
            child: Row(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      articleInfo.title,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      articleInfo.brief,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                width: screenSize.width - imgSize - 10,
              ),
              SizedBox(
                width: imgSize,
                height: imgSize,
                child: CachedNetworkImage(
                  imageUrl: articleInfo.mainImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Image.asset(
                      "Images/placeholder_image.png",
                      fit: BoxFit.fill,
                    );
                  },
                ),
              )
            ],
          ),
          onTap: ()=>{
            gotoArticle(context)
          },
          ),
          SizedBox(
            height: 6,
          ),
          ArticleTagsView(tags: articleInfo.tags)
        ],
      ),
    );
  }

  void gotoArticle(BuildContext context){
    Navigator.of(context).pushNamed("/project/blog/article",arguments: articleInfo);
  }

  void gotoUser(){
   
  }


}

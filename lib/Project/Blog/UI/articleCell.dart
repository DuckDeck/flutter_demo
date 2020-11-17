import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';

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
              
              Container(child: Text(articleInfo.userInfo.realName,style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold),),margin: EdgeInsets.fromLTRB(6, 0, 0, 0),),
              
              Icon(Icons.comment),
              Text("${articleInfo.commentCount}条评论"),
              
              Icon(Icons.favorite),
              Text("${articleInfo.likeCount}人喜欢"),
            ],
          ),
          Row(children: [
            Container(child: Column(children: [
              Text(articleInfo.title, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Text(articleInfo.brief, style: TextStyle(fontSize: 12,),maxLines: 5,overflow: TextOverflow.ellipsis,)
            ],),width: screenSize.width - imgSize - 10,),
             SizedBox(width: imgSize,height: imgSize, child:  CachedNetworkImage(imageUrl: articleInfo.mainImage,fit: BoxFit.cover,placeholder: (context,url){
               return Image.asset("Images/placeholder-image.png",fit: BoxFit.fill,);
             },),)
          ],)
        ],
      ),
    );
  }
}

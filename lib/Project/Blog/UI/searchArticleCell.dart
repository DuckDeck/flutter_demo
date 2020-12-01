import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchArticelCell extends StatelessWidget {
  ArticleInfo info;
  SearchArticelCell({this.info});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(children: [
            ClipOval(
                child: CachedNetworkImage(
                    imageUrl: info.userInfo.headImage,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Image.asset("Images/placeholder_head.jpg")),
              ),
              SizedBox(width: 5),
              Text(info.userInfo.userName),
              SizedBox(width: 5),
              Text(info.CreateTimeStr),
          ],),
          Row(children: [
            Column(children: [
              Text(info.title),
              Text(info.brief)
            ],),
            CachedNetworkImage(
                  imageUrl: info.mainImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Image.asset(
                      "Images/placeholder_image.png",
                      fit: BoxFit.fill,
                    );
                  },
                ),
          ],)
        ],
      ),
    );
  }
}

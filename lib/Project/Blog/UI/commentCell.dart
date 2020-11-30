import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/CommentInfo.dart';

class CommentCell extends StatelessWidget {
  final CommentInfo commentInfo;
  CommentCell({this.commentInfo});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
          child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                    imageUrl: commentInfo.userInfo.headImage,
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Image.asset("Images/placeholder_head.jpg")),
              ),
              Column(
                children: [
                  Text(commentInfo.userInfo.userName),
                  Text("发布于${commentInfo.CommentTimeStr}"),
                ],
              )
            ],
          ),
          Text(commentInfo.content)
        ],
      )),
    );
  }
}

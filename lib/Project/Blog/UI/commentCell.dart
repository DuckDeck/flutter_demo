import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/CommentInfo.dart';

class CommentCell extends StatelessWidget {
  final CommentInfo commentInfo;
  CommentCell({this.commentInfo,this.addSubComent});
  final Function addSubComent;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(commentInfo.userInfo.userName),
                        Text("发布于${commentInfo.CommentTimeStr}"),
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.comment,size: 20,), onPressed: (){
                    addSubComent(commentInfo);
                  })
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                commentInfo.content,
                style: TextStyle(fontSize: 16),
              ),
              commentInfo.subComments.length > 0
                  ? Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: commentInfo.subComments
                            .map((e) => Text(e.content))
                            .toList(),
                      ))
                  : SizedBox(
                      height: 0,
                    ),
            ],
          )),
    );
  }
}

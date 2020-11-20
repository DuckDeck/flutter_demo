import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleTaginfo.dart';

class ArticleTagsView extends StatelessWidget {

  final List<ArticleTagInfo> tags;
  ArticleTagsView({this.tags});

  @override
  Widget build(BuildContext context) {
    return   Wrap(
              spacing: 8,
              runSpacing: 4,
              alignment: WrapAlignment.start,
              children: tags
                  .map((e) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 5),

                    
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue,),borderRadius: BorderRadius.all(Radius.circular(4))),
                      child:
                         Text(
                        e.tagName,
                        style: TextStyle(
                          color: Colors.blue,
                          height: 1.1
                        ),
                      )))
                  .toList());
  }
}
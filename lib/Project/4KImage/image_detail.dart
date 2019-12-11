import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/4KImage/model.dart';


class ImageDetail extends StatefulWidget {
  ImageDetail({this.imgInfo});
  final ImgInfo imgInfo;
  
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(widget.imgInfo.imgName),),
       body: Container(
         padding: EdgeInsets.all(10.0),
         child: Column(
           
         ),
       ),
    );
  }


 

}
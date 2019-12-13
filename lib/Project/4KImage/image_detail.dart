import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/4KImage/model.dart';
import 'package:dio/dio.dart';
import 'package:gbk2utf8/gbk2utf8.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as html;
import 'package:flutter/cupertino.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_page.dart';
class ImageDetail extends StatefulWidget {
  ImageDetail({this.imgInfo});
  final ImgInfo imgInfo;
  
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  ImgDetail imgDetail ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(widget.imgInfo.imgName),),
       body: FutureBuilder<ImgDetail>(
         future: _getData(),
         builder:  (BuildContext context, AsyncSnapshot<ImgDetail> snapshot){
           print("snapshot.data.imgUrl");
           print(snapshot.data);
            return SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Image.network(snapshot.data.imgUrl),
               Container(
                 padding: EdgeInsets.symmetric(vertical: 10.0),
                 child:  Row(
                  children: <Widget>[
                    Text("尺寸:${snapshot.data.resolution.toString()}"),
                    Text("体积:${snapshot.data.sizeStr}"),
                    Text("上传时间:${snapshot.data.updateTimeStr}")
                  ],
                ),
               ),
               Container(
                 padding: EdgeInsets.symmetric(vertical: 10.0),
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(child: Text("下载"),onPressed: (){
                        saveImage(snapshot.data.imgUrl);
                    },),
                    RaisedButton(child: Text("原图下载"),onPressed: (){
                      Fluttertoast.showToast(msg: "下载原图需要登录才行,现在开始登录");
                      toLogin();
                    },)
                  ],
                ),
               ),
               Text("更多相似图片"),
               Column(children: snapshot.data.moreImages.map((item){
                return GestureDetector(child: Image.network(item.imgUrl),onTap: (){toPage(item);});
               }).toList(),)
              ],
            ),
            );
         }

       )
    );
  }

  void toLogin(){
       Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
            return LoginPage();
       }));
  }

  void toPage(ImgInfo item){
     Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
            return ImageDetail(imgInfo: item,);
       }));
  }

  void saveImage(String img) async{
     var response = await Dio().get(img, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    if(result){
       Fluttertoast.showToast(msg: "下载成功，但是下载原图需要登录才行");
    }
    else{
      Fluttertoast.showToast(msg: "下载失败");
    }
  }

  Future<ImgDetail> _getData() async{
    Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    Response<List<int>> res = await dio.get<List<int>>(widget.imgInfo.imgPage);
    final result = decodeGbk(res.data);

    html.Document dom = parse(result);
    var a =  dom.body.querySelector("a#img");
    String imgUrl = "http://pic.netbian.com/" + a.firstChild.attributes["src"];
    final info = dom.body.querySelector("div.infor");
    
    final resolution = Reslotion.parse(info.children[1].children.first.text);
    final size =  info.children[2].children.first.text;
    final updateTime =  info.children[3].children.first.text;
    final imgDetail = ImgDetail();
    print("imgUrl");
    print(imgUrl);
    imgDetail.sizeStr = size;
    imgDetail.imgUrl =  imgUrl;
    imgDetail.updateTimeStr = updateTime;
    imgDetail.resolution = resolution;
    var more = dom.body.querySelector("ul.clearfix");
    print(more);
    // more.children.forEach((f){
    //   var imgTag = f.querySelector("img");
    //   var title = f.querySelector("a");
    //   print(f);
    //   print(imgTag.attributes["src"]);
    //   print(title.attributes["title"]);
    // });
    final imgs = more.children.map((item){
      var imgTag = item.querySelector("img");
      var title = item.querySelector("a");
      var u = "http://pic.netbian.com/" + imgTag.attributes["src"];
      final imgPage = "http://pic.netbian.com/"+ title.attributes["href"];
      return ImgInfo(imgUrl:u,imgName: title.attributes["title"],imgPage: imgPage);
    }).toList();
    print(imgs);
    imgDetail.moreImages = imgs;
     return imgDetail;
  }

 

}



 
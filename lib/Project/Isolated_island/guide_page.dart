import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:flutter_demo/Widget/widget_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
class GuidePage extends StatelessWidget {
  
  final pages = [PageViewModel(pageColor: Colors.red,iconColor: 
  Colors.pink,bubbleBackgroundColor: Colors.orange,body: Text("这个孤岛很好玩"),title: Text("NO1!"),
  mainImage: Container(
    decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.red),),
    child: Image.asset("Images/1.jpg")))];
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(pages
    ,onTapDoneButton: (){
      goto(context);
    },
    onTapSkipButton: (){
      goto(context);
    },);
  }

  goto(BuildContext context){
    Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                return BottomNavBarWidget();
       }));
  }

}
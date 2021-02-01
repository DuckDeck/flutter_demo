import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Tool/NotificationCenter.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CollectClickView extends StatefulWidget {
  var isSelect = false;
  var num = 0;
  var title = "喜欢";
  var icon = Icons.favorite;
  CollectClickView({this.isSelect, this.num, this.title, this.icon});

  @override
  _CollectClickViewState createState() => _CollectClickViewState();
}

class _CollectClickViewState extends State<CollectClickView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (currentUser == null){
          Fluttertoast.showToast(msg: "你还没有登录，请登录后进行点赞操作");
          Future.delayed(Duration(microseconds: 300),(){
            Navigator.of(context).pushNamed("/project/blog/login").then((value) => {
              NotifcationCenter.instance.postNotification(loginNotif, loginNotif)
              
            });
          });
        }
      },
      child: Container(
        width: 100,
        height: 30,
        child: Row(
          children: [
            Expanded(flex: 4, child: Icon(widget.icon,size: 17,color: widget.isSelect ? Colors.white : Colors.purple,)),
            Expanded(flex: 3,child: Text(widget.title,style: TextStyle(color: widget.isSelect ? Colors.white : color_999999,))),
            Expanded(flex: 2,child: VerticalDivider(color: widget.isSelect ? Colors.white : color_999999,)),
            Expanded(flex: 2,child: Text(widget.num == null ? "" :  widget.num.toString(),style: TextStyle(color: widget.isSelect ? Colors.white : color_999999,),))
          ],
        ),
        decoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 1),color: widget.isSelect ? Colors.orangeAccent : Colors.white,borderRadius: BorderRadius.horizontal(left: Radius.circular(15),right: Radius.circular(15))),
      ),
    );
  }


}

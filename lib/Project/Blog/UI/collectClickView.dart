import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/config.dart';

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
      child: Container(
        width: 100,
        height: 50,
        color: widget.isSelect ? Colors.purple : Colors.white,
        child: Row(
          children: [
            Expanded(child: Icon(widget.icon)),
            Expanded(child: Text(widget.title,style: TextStyle(color: widget.isSelect ? Colors.white : color_999999,))),
            Expanded(child: VerticalDivider(color: widget.isSelect ? Colors.white : color_999999,)),
            Expanded(child: Text(widget.num.toString(),style: TextStyle(color: widget.isSelect ? Colors.white : color_999999,),))
          ],
        ),
        decoration: BoxDecoration(),
      ),
    );
  }


}

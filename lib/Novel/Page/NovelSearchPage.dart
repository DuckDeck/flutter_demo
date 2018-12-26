import 'package:flutter/material.dart';
import 'package:flutter_demo/Novel/Model/NovelInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo/Novel/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
class NovelSearch extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => new _NovelSearchState();
}

class _NovelSearchState extends State<NovelSearch>{
  ScrollController _controller = new ScrollController(); 
  List<NovelInfo> novels = List<NovelInfo>();
  TextEditingController _textController = new TextEditingController();
  FocusNode textFocus = new FocusNode();
  var isLoading = false;
  @override
    void initState() {
      super.initState();
      _textController.text = "星辰变";
         _controller.addListener((){
        print(_controller.offset);
       if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
         print('滑动到了最底部');
         if(novels.length >= 10){
           _loadmore();
         }
       }
      });
    }



  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: new AppBar(title: new Text("小说搜索"),),
        body: Container(
          padding: EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Row(children: <Widget>[
              
              new Expanded(
                  child: TextField(decoration: InputDecoration(
                      hintText: "输入小说名开始搜索", 
                    ), controller: _textController,focusNode: textFocus,),
                    ),
              SizedBox(width: 10,),
              FlatButton(child: Text("搜索"),onPressed: _search,)
            ],),
         
          new Flexible( child:
            ListView.builder(
              controller: _controller,
              itemBuilder: (BuildContext context,int index){
                // if(isLoading){
                //   if(index < novels.length){
                //     return NovelInfoView(novelInfo: novels[index],);
                //   }
                //   return _getMoreWidget();
                // }
                // else{
                //   return NovelInfoView(novelInfo: novels[index],);
                // }
                
                 if(index < novels.length){
                    return NovelInfoView(novelInfo: novels[index],);
                  }
                  return isLoading ? _getMoreWidget() : null;
              },
              itemCount: novels.length + 1,
               //itemCount: isLoading ? novels.length + 1 : novels.length,
          ),
          )
        ],
      ),),
      );

      
    }

    
    void _search(){
      if(_textController.text.length <= 0){
        Fluttertoast.showToast(msg: "小说名不能为空",toastLength:Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM);
        return;
      }
      getData(_textController.text, 0);
      textFocus.unfocus();
    }

    getData(String key,int index) async{
      print(key);
      var res = await NovelInfo.getNovelList(_textController.text, index);

      if(res.length <= 0){
        Fluttertoast.showToast(msg: "没有搜索到小说",toastLength:Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM);
        return;
      }
      if(index == 0){
         setState(() {
           isLoading = false;
          novels = res;
        });
      }
      else{
         setState(() {
            isLoading = false;
          novels += res;
        });
      }
    }

    void _loadmore(){
      if(!isLoading){
        setState(() {
          isLoading = true;
        });
      }
      getData(_textController.text, novels.length % 10 + 1);
    }

    Widget _getMoreWidget() {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...     ',
                style: TextStyle(fontSize: 16.0),
              ),
              CircularProgressIndicator(strokeWidth: 1.0,)
            ],
          ),
        ),
     );
  }

  @override
    void dispose() {

      super.dispose();
      _controller.dispose();
      _textController.dispose(); 
    }

}





class NovelInfoView extends StatelessWidget{
  const NovelInfoView({Key key,this.novelInfo}) : assert(novelInfo != null) ,super(key:key);

  final NovelInfo  novelInfo;

  @override
    Widget build(BuildContext context) {
      var img = CachedNetworkImage(imageUrl: novelInfo.cover,placeholder: Constants.NovelImagePlaceHolder,width: 100,height: 180,);
      var name = Text(novelInfo.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),);
      var desc = Text(novelInfo.desc);
      var author = Text("作者: " + novelInfo.author);
      var type = Text("类型: " + novelInfo.type);
      var updateTime = Text("更新时间: " +novelInfo.updateTime );
      return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border(
          bottom: BorderSide(
            color: Color(Constants.Color_Divider), 
            width: 0.5)
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            img,
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  name,
                  desc,
                  author,
                  type,
                  updateTime
                ],
              ),
            )
          ],
        ),
      );

    }

}
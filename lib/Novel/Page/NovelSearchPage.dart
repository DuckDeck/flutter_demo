import 'package:flutter/material.dart';
import 'package:flutter_demo/Novel/Model/NovelInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo/Novel/config.dart';
class NovelSearch extends StatefulWidget{
  @override
    State<StatefulWidget> createState() => new _NovelSearchState();
}

class _NovelSearchState extends State<NovelSearch>{
  ScrollController _controller = new ScrollController(); 
  List<NovelInfo> novels = List<NovelInfo>();
  String key = "";
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
         _controller.addListener((){
        print(_controller.offset);
       if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
         print('滑动到了最底部');
         getData(key, novels.length % 10 + 1).then((res){
             setState(() {
              novels += res;
            });
         });
      }

      });
    }



  @override
    Widget build(BuildContext context) {
      return Container(child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (BuildContext context,int index){
            return NovelInfoView(novelInfo: novels[index],);
          },
          itemCount: novels.length,
        ),
      ),);
    }
    Future<Null> _onRefresh() async {
       var res = await getData(key, 0);
       setState(() {
          novels = res;
        });
    }
    Future<List<NovelInfo>> getData(String key,int index) async{
      return await NovelInfo.getNovelList(key, index);
    }
}

class NovelInfoView extends StatelessWidget{
  const NovelInfoView({Key key,this.novelInfo}) : assert(novelInfo != null) ,super(key:key);

  final NovelInfo  novelInfo;

  @override
    Widget build(BuildContext context) {
      var img = CachedNetworkImage(imageUrl: novelInfo.cover,placeholder: Constants.NovelImagePlaceHolder,width: 300,height: 400,);
      var name = Text(novelInfo.name);
      var desc = Text(novelInfo.desc);

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
                  desc
                ],
              ),
            )
          ],
        ),
      );

    }

}
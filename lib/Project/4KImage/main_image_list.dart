import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gbk2utf8/gbk2utf8.dart';
import 'model.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart' as html;
import 'package:flutter/cupertino.dart';
import 'image_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
class MainImageList extends StatefulWidget {
  @override
  _MainImageListState createState() => _MainImageListState();
}

class _MainImageListState extends State<MainImageList>  with SingleTickerProviderStateMixin {

  var titles = [CatInfo(name: "最新",urlSegment: "new"),CatInfo(name: "风景",urlSegment: "4kfengjing"),
  CatInfo(name: "美女",urlSegment: "4kmeinv"),CatInfo(name: "游戏",urlSegment: "4kyouxi"),
  CatInfo(name: "动漫",urlSegment: "4kdongman"),CatInfo(name: "影视",urlSegment: "4kyingshi"),
  CatInfo(name: "明星",urlSegment: "4kmingxing"),CatInfo(name: "汽车",urlSegment: "4kqiche"),
  CatInfo(name: "动物",urlSegment: "4kdongwu"),CatInfo(name: "人物",urlSegment: "4krenwu"),
  CatInfo(name: "美食",urlSegment: "4kmeishi"),CatInfo(name: "宗教",urlSegment: "4kzongjiao"),
  CatInfo(name: "背景",urlSegment: "4kbeijing"),];
 

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return DefaultTabController(
      length: 13,
      child: Scaffold(
        appBar: AppBar(title: const Text("美图"),
         actions: <Widget>[
            IconButton(icon: Icon(Icons.search),onPressed: (){
            print("开始搜索");
            showSearch(context: context,delegate: SearchBarDelegate());
          },)
         ],
         bottom: TabBar(
          isScrollable: true,
          tabs:titles.map((title){
            return Tab(text: title.name,);
          }).toList(),
        ),),
        
        body: TabBarView(
          children: titles.map((img){
            return ScrollImagesPage(imgCat: img,);
          }).toList()
        ),
      ),
    );
  }
}

class ScrollImagesPage extends StatefulWidget  {
  ScrollImagesPage({this.imgCat});
  final CatInfo imgCat;
  @override
  _ScrollImagesPageState createState() => _ScrollImagesPageState();
}

class _ScrollImagesPageState extends State<ScrollImagesPage> with AutomaticKeepAliveClientMixin{

ScrollController _scrollController = ScrollController();
int _page = 0;
int _eLoading = 0; //0不显示 1 正在请求 2 没有更多数据
List<ImgInfo> items = [];

@override
 bool get wantKeepAlive => true;

@override
  void initState() {
    super.initState();
    _refreshData();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print("到最下在开始圆形更多");
        _addMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Container(
        color: Colors.grey[100],
        child: StaggeredGridView.countBuilder(
          controller: _scrollController,
          itemCount: items.length,
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context,index)=>ImageCell(imageInfo: items[index],),
          staggeredTileBuilder: (index)=>StaggeredTile.fit(2),
        ),
      ),
    );
  }

  Future<Null> _refreshData() async{
    _page = 0;
    items.clear();
   _getData(false);
  }

  Future<Null> _addMoreData() async{
    _page ++;
    _getData(true);
  }

  void _getData(bool _deAdd) async{
    print("开始请求，类型是${widget.imgCat.name}");
    var index = "";
    if(_page > 0){
     
      index = "index_${_page+1}.html";
    }

    var url = "http://pic.netbian.com/${widget.imgCat.urlSegment}/$index";
    print(url);
    Dio dio = Dio();
    dio.options.responseType = ResponseType.bytes;
    Response<List<int>> res = await dio.get<List<int>>(url);
    final result = decodeGbk(res.data);

    html.Document dom = parse(result);
    var uls =  dom.body.querySelector("ul.clearfix");
    
  
    setState(() {
      items += uls.children.map((img){
        final tag = img.firstChild;
        final imgPage = "http://pic.netbian.com/" + tag.attributes["href"];
        final imgUrl = "http://pic.netbian.com/" + tag.firstChild.attributes["src"];
        final imgName = tag.firstChild.attributes["alt"];
        return ImgInfo(imgName: imgName,imgPage: imgPage,imgUrl: imgUrl);
      }).toList();
    });
    
  }

}

class ImageCell extends StatelessWidget {
  ImageCell({this.imageInfo});
  final ImgInfo imageInfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: Card(
      child: Container(
        
        child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              minHeight: ScreenUtil.instance.setHeight(200)
            ),
            child: CachedNetworkImage(imageUrl: imageInfo.imgUrl,
          
            placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
            errorWidget: (context,url,error)=>Icon(Icons.error),
          ),
          ),
          Center(child: Text(imageInfo.imgName),)
        ],
      ),
      )
    ),
    onTap: (){
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                return ImageDetail(imgInfo: imageInfo,);
       }));
    },
    );
  }
}


class SearchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon:Icon(Icons.clear),
        onPressed: ()=>query = "",)
      ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }
   @override
  Widget buildSuggestions(BuildContext context) {
    // final suggestionList = query.isEmpty
    //     ? recentSuggest
    //     : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                  text: TextSpan(
                      text: "123",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: "456",
                        style: TextStyle(color: Colors.grey))
                  ])),
            ));
  }
}
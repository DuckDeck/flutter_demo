
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
class NovelInfo{
  const NovelInfo({
    this.name,
    this.author,
    this.desc,
    this.cover,
    this.link
  });
  final String name;
  final String desc;
  final String author;
  final String cover;
  final String link;

  static Future<List<NovelInfo>> getNovelList(String key,int index) async{
     try{
        Dio dio = new Dio();
       Response<String> response=await dio.get("http://zhannei.baidu.com/cse/search",
       data: {'q':key,'p':index,'isNeedCheckDomain':1,'jump':1,'s':'2041213923836881982'});
       var docu = parse(response.data);
      var items = docu.querySelectorAll('.result-game-item');
      var novels = List<NovelInfo>();
      for(var item in items){
        var img = item.querySelector('.result-game-item-pic-link-img').attributes["href"];
        var name = item.querySelector('.result-game-item-title-link').attributes['title'];
        var link = item.querySelector('.result-game-item-title-link').attributes["href"];
        var author = item.querySelector('.result-game-item-info-tag-title').text;
        novels.add(new NovelInfo(author: author,name:name,cover:img,link:link));
        
      }
      return novels;
     }
     catch(ex){
       print(ex.toString());
       return null;
     }
  }

}
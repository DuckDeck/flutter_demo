
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
class NovelInfo{
  const NovelInfo({
    this.name,
    this.author,
    this.desc,
    this.cover,
    this.link,
    this.updateTime,
    this.type
  });
  final String name;
  final String desc;
  final String author;
  final String cover;
  final String link;
  final String type;
  final String updateTime;
  static Future<List<NovelInfo>> getNovelList(String key,int index) async{
     try{
        Dio dio = new Dio();
       Response<String> response=await dio.get("http://zhannei.baidu.com/cse/search",
       data: {'q':key,'p':index,'isNeedCheckDomain':1,'jump':1,'s':'2041213923836881982'});
       var docu = parse(response.data);
       var novels = List<NovelInfo>();
      var items = docu.querySelectorAll('.result-game-item');
      if(items.length > 0){
         for(var item in items){
          var img = item.querySelector('.result-game-item-pic-link-img').attributes["src"] ?? '';
          var name = item.querySelector('.result-game-item-title-link').attributes['title'] ?? '';
          var link = item.querySelector('.result-game-item-title-link').attributes["href"] ?? '';
          var infos = item.querySelectorAll('p.result-game-item-info-tag');
          var desc = item.querySelector('.result-game-item-desc').text ?? '';
          var author = '';
          var type = '';
          var updateTime = '';
          
          for(var info in infos){
            if(info.children[0].text == "作者："){
                author = info.children[1].text.trim();
            }
            if(info.children[0].text == "更新时间："){
                updateTime = info.children[1].text;
            }
            if(info.children[0].text == "类型："){
                type = info.children[1].text;
            }
          }
          print(author);
          novels.add(new NovelInfo(author: author,name:name,cover:img,link:link,desc: desc,type: type,updateTime: updateTime));
        }
      }
     
      return novels;
     }
     catch(ex){
       print(ex.toString());
       return null;
     }
  }

}
import 'dart:typed_data';
import 'package:html/parser.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:gbk2utf8/gbk2utf8.dart';
class SectionInfo{
  const SectionInfo({
    this.name,
    this.link,
  });
  final String name;
  final String link;
  static Future<List<SectionInfo>> getSectionList(String link) async{
     try{
        Dio dio = new Dio();
        Response<String> response=await dio.get(link);
 
        
     //困为搞不定GBK转UTF8，所以不做了
       var docu = parse(response.data);
       var novels = List<SectionInfo>();
       var items = docu.querySelector('div#list').getElementsByTagName("dd");
       
       if(items.length > 0){
         for(var item in items){
          var name = item.text;
          var link = item.attributes["href"];
          print(name);
          novels.add(new SectionInfo(name:name,link:link));
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
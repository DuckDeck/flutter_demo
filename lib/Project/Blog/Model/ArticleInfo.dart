import 'package:dio/dio.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleTaginfo.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/Project/Five/fiveStrokeInfo.dart';
import 'package:flutter_demo/ResultInfo.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ArticleInfo.g.dart';

@JsonSerializable()
@immutable
class ArticleInfo {
  @JsonKey(name: "article_id")
  int id;
  @JsonKey(name: "article_name")
  String title;
  @JsonKey(name: "article_create_time")
  int createTime;
  String createTimeStr;
  @JsonKey(name: "article_release_time")
  int releaseTime;
  String releaseTimeStr;
  @JsonKey(name: "article_ip")
  String ipAddress;
  @JsonKey(name: "article_click")
  int clickCount;

  @JsonKey(name: "article_sort_id")
  int sortId;

  @JsonKey(name: "user_id")
  int userId;

  @JsonKey(name: "article_type_id")
  int typeId;

  @JsonKey(name: "article_type")
  int type;

  @JsonKey(name: "article_brief")
  String brief;

  @JsonKey(name: "article_main_img")
  String mainImage;

  @JsonKey(name: "article_up")
  int up;

  @JsonKey(name: "article_recommend")
  int recommend;

  @JsonKey(name: "article_status")
  int status;

  @JsonKey(name: "article_sort_name")
  String sortName;

  @JsonKey(name: "comment_count")
  int commentCount;

  @JsonKey(name: "like_count")
  int likeCount;

 @JsonKey(name: "userInfo")
  UserInfo userInfo;
 @JsonKey(name: "tags")
  List<ArticleTagInfo> tags;


  ArticleInfo();

  factory ArticleInfo.fromJson(Map<String, dynamic> json) =>
      _$ArticleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleInfoToJson(this);

  static Future<ResultInfo> indexPage() async {
    final url = BaseUrl + "/index";
    final dio = new Dio();
    final res = await dio.get(url);
    final result =  ResultInfo.toResult(res);
    if(result.code != 0){
      return result;
    }
    Map<String,dynamic> items = result.data;
    List<dynamic> bannersData = items["top"];
    Map<String,dynamic> resData = Map<String,dynamic>();
    List<ArticleInfo> banners = List<ArticleInfo>();
    for (var item in bannersData) {
      final a = ArticleInfo.fromJson(item);
      banners.add(a);
    }
    resData["banners"] = banners;

    List<dynamic> articlesData = items["articles"];
    List<ArticleInfo> articles = List<ArticleInfo>();
    for (var item in articlesData) {
      final a = ArticleInfo.fromJson(item);
      articles.add(a);
    }
    resData["articles"] = articles;
    result.data = resData;
    return result;
  }

}

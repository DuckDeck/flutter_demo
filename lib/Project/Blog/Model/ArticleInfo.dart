import 'package:dio/dio.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleTaginfo.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/ResultInfo.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import '../Tool/extension.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
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
  String get CreateTimeStr{
    return createTime.toTime();
  }
  @JsonKey(name: "article_release_time")
  int releaseTime;
  String releaseTimeStr;

  @JsonKey(name: "article_ip")
  String ipAddress;

  @JsonKey(name: "article_content")
  String content;

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
  int commentCount = 0;

  @JsonKey(name: "like_count")
  int likeCount;

  @JsonKey(name: "collect_count")
  int collectCount;

  @JsonKey(name: "is_user_collect")
  bool isUserCollect;

  @JsonKey(name: "is_user_like")
  bool isUserLike;

  @JsonKey(name: "userInfo")
  UserInfo userInfo;
  @JsonKey(name: "tags")
  List<ArticleTagInfo> tags;

  ArticleInfo();

  factory ArticleInfo.fromJson(Map<String, dynamic> json) =>
      _$ArticleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleInfoToJson(this);

  static Future<ResultInfo> indexPage(int index) async {
    var url = BaseUrl + "/index";
    if (index > 0) {
      url = url + "/$index/10";
    }
    final dio = new Dio();
    dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    final res = await dio.get(url,options: buildCacheOptions(Duration(hours: 1)));
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    if (index == 0) {
      Map<String, dynamic> items = result.data;
      List<dynamic> bannersData = items["top"];
      Map<String, dynamic> resData = Map<String, dynamic>();
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
    }
    else{
      List<ArticleInfo> articles = List<ArticleInfo>();
      List<dynamic> articlesData = result.data;
      for (var item in articlesData) {
        final a = ArticleInfo.fromJson(item);
        articles.add(a);
      }
      result.data = articles;
    }

    return result;
  }

  static Future<ResultInfo> articleInfo(int articleId) async{
    var url = BaseUrl + "/article/" + articleId.toString() + "/0/0";
    final dio = new Dio();
    final res = await dio.get(url);
    
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    final article = ArticleInfo.fromJson(result.data);
    result.data = article;
    return result;
  }

  static Future<ResultInfo> searchArticle(String key,int index) async{
    var url = "$BaseUrl/search/$key/article/$index/10";
    final dio = new Dio();
    final res = await dio.get(url);
    
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    final article = ArticleInfo.fromJson(result.data);
    result.data = article;
    return result;
  }

}

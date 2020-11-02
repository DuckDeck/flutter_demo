
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ArticleTaginfo.g.dart';
@JsonSerializable()
@immutable
class ArticleTagInfo {
   @JsonKey(name: "tag_id")
  int id;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "tag_name")
  String tagName;
  @JsonKey(name: "article_id")
  int articleId;
  ArticleTagInfo();
    factory ArticleTagInfo.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleTagInfoToJson(this);

}
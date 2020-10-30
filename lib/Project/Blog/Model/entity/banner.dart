import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';
@JsonSerializable()
@immutable
class BannerInfo {
  @JsonKey(name: "article_id")
  final int articleId ;
  @JsonKey(name: "article_name")
  final String articleName;
  @JsonKey(name: "article_main_img")
  final String articleMainImg;
  @JsonKey(name: "article_brief")
  final String articleBrief;
  BannerInfo({
    this.articleId = 0,
    this.articleName = '',
    this.articleMainImg = '',
    this.articleBrief = ''
  });

}

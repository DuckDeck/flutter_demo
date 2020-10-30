// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerInfo _$BannerInfoFromJson(Map<String, dynamic> json) {
  return BannerInfo(
    articleId: json['article_id'] as int,
    articleName: json['article_name'] as String,
    articleMainImg: json['article_main_img'] as String,
    articleBrief: json['article_brief'] as String,
  );
}

Map<String, dynamic> _$BannerInfoToJson(BannerInfo instance) =>
    <String, dynamic>{
      'article_id': instance.articleId,
      'article_name': instance.articleName,
      'article_main_img': instance.articleMainImg,
      'article_brief': instance.articleBrief,
    };

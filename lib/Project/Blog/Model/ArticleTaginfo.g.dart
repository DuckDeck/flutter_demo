// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleTaginfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleTagInfo _$ArticleTagInfoFromJson(Map<String, dynamic> json) {
  return ArticleTagInfo()
    ..id = json['tag_id'] as int
    ..userId = json['user_id'] as int
    ..tagName = json['tag_name'] as String
    ..articleId = json['article_id'] as int;
}

Map<String, dynamic> _$ArticleTagInfoToJson(ArticleTagInfo instance) =>
    <String, dynamic>{
      'tag_id': instance.id,
      'user_id': instance.userId,
      'tag_name': instance.tagName,
      'article_id': instance.articleId,
    };

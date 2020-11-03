// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArticleInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleInfo _$ArticleInfoFromJson(Map<String, dynamic> json) {
  return ArticleInfo()
    ..id = json['article_id'] as int
    ..title = json['article_name'] as String
    ..createTime = json['article_create_time'] as int
    ..createTimeStr = json['createTimeStr'] as String
    ..releaseTime = json['article_release_time'] as int
    ..releaseTimeStr = json['releaseTimeStr'] as String
    ..ipAddress = json['article_ip'] as String
    ..clickCount = json['article_click'] as int
    ..sortId = json['article_sort_id'] as int
    ..userId = json['user_id'] as int
    ..typeId = json['article_type_id'] as int
    ..type = json['article_type'] as int
    ..brief = json['article_brief'] as String
    ..mainImage = json['article_main_img'] as String
    ..up = json['article_up'] as int
    ..recommend = json['article_recommend'] as int
    ..status = json['article_status'] as int
    ..sortName = json['article_sort_name'] as String
    ..commentCount = json['comment_count'] as int
    ..likeCount = json['like_count'] as int
    ..userInfo = json['userInfo'] == null
        ? null
        : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>)
    ..tags = (json['tags'] as List)
        ?.map((e) => e == null
            ? null
            : ArticleTagInfo.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArticleInfoToJson(ArticleInfo instance) =>
    <String, dynamic>{
      'article_id': instance.id,
      'article_name': instance.title,
      'article_create_time': instance.createTime,
      'createTimeStr': instance.createTimeStr,
      'article_release_time': instance.releaseTime,
      'releaseTimeStr': instance.releaseTimeStr,
      'article_ip': instance.ipAddress,
      'article_click': instance.clickCount,
      'article_sort_id': instance.sortId,
      'user_id': instance.userId,
      'article_type_id': instance.typeId,
      'article_type': instance.type,
      'article_brief': instance.brief,
      'article_main_img': instance.mainImage,
      'article_up': instance.up,
      'article_recommend': instance.recommend,
      'article_status': instance.status,
      'article_sort_name': instance.sortName,
      'comment_count': instance.commentCount,
      'like_count': instance.likeCount,
      'userInfo': instance.userInfo,
      'tags': instance.tags,
    };

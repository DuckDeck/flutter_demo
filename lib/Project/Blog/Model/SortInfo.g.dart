// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SortInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SortInfo _$SortInfoFromJson(Map<String, dynamic> json) {
  return SortInfo()
    ..id = json['sort_article_id'] as int
    ..userId = json['user_id'] as int
    ..sortName = json['sort_article_name'] as String;
}

Map<String, dynamic> _$SortInfoToJson(SortInfo instance) => <String, dynamic>{
      'sort_article_id': instance.id,
      'user_id': instance.userId,
      'sort_article_name': instance.sortName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserLinkInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLinkInfo _$UserLinkInfoFromJson(Map<String, dynamic> json) {
  return UserLinkInfo()
    ..id = json['link_user_id'] as int
    ..name = json['link_name'] as String
    ..url = json['link_url'] as String
    ..type = json['link_type'] as int;
}

Map<String, dynamic> _$UserLinkInfoToJson(UserLinkInfo instance) =>
    <String, dynamic>{
      'link_user_id': instance.id,
      'link_name': instance.name,
      'link_url': instance.url,
      'link_type': instance.type,
    };

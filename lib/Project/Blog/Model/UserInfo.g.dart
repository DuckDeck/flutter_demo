// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo()
    ..id = json['user_id'] as int
    ..realName = json['user_real_name'] as String
    ..headImage = json['user_image_url'] as String;
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'user_id': instance.id,
      'user_real_name': instance.realName,
      'user_image_url': instance.headImage,
    };

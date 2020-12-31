// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo()
    ..id = json['user_id'] as int
    ..realName = json['user_real_name'] as String
    ..articleCount = json['article_count'] as int
    ..commentCount = json['comment_count'] as int
    ..headImage = json['user_image_url'] as String
    ..address = json['user_address'] as String
    ..birthday = json['user_birthday'] as int
    ..description = json['user_description'] as String
    ..email = json['user_email'] as String
    ..gender = json['user_gender'] as int
    ..userName = json['user_name'] as String
    ..phone = json['user_phone'] as String
    ..qq = json['user_qq'] as String
    ..says = json['user_says'] as String
    ..token = json['token'] as String;
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'user_id': instance.id,
      'user_real_name': instance.realName,
      'article_count': instance.articleCount,
      'comment_count': instance.commentCount,
      'user_image_url': instance.headImage,
      'user_address': instance.address,
      'user_birthday': instance.birthday,
      'user_description': instance.description,
      'user_email': instance.email,
      'user_gender': instance.gender,
      'user_name': instance.userName,
      'user_phone': instance.phone,
      'user_qq': instance.qq,
      'user_says': instance.says,
      'token': instance.token,
    };

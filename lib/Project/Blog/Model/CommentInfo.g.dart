// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommentInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentInfo _$CommentInfoFromJson(Map<String, dynamic> json) {
  return CommentInfo()
    ..id = json['comment_id'] as int
    ..targetId = json['comment_target_id'] as int
    ..targetUserId = json['comment_target_user_id'] as int
    ..commentTime = json['comment_time'] as int
    ..content = json['comment_content'] as String
    ..subComments = (json['sub_comments'] as List)
        ?.map((e) =>
            e == null ? null : CommentInfo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..userInfo = json['userInfo'] == null
        ? null
        : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CommentInfoToJson(CommentInfo instance) =>
    <String, dynamic>{
      'comment_id': instance.id,
      'comment_target_id': instance.targetId,
      'comment_target_user_id': instance.targetUserId,
      'comment_time': instance.commentTime,
      'comment_content': instance.content,
      'sub_comments': instance.subComments,
      'userInfo': instance.userInfo,
    };

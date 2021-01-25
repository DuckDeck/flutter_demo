// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MessageInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageInfo _$MessageInfoFromJson(Map<String, dynamic> json) {
  return MessageInfo()
    ..senderId = json['sender_id'] as int
    ..receiveId = json['receive_id'] as int
    ..readStatus = json['read_status'] as int
    ..messageTime = json['message_time'] as int
    ..userInfo = json['user_info'] == null
        ? null
        : UserInfo.fromJson(json['user_info'] as Map<String, dynamic>)
    ..chatInfo = json['chat_info'] == null
        ? null
        : ChatInfo.fromJson(json['chat_info'] as Map<String, dynamic>)
    ..extraInfo = (json['extraInfo'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$MessageInfoToJson(MessageInfo instance) =>
    <String, dynamic>{
      'sender_id': instance.senderId,
      'receive_id': instance.receiveId,
      'read_status': instance.readStatus,
      'message_time': instance.messageTime,
      'user_info': instance.userInfo,
      'chat_info': instance.chatInfo,
      'extraInfo': instance.extraInfo,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatInfo _$ChatInfoFromJson(Map<String, dynamic> json) {
  return ChatInfo()
    ..id = json['id'] as int
    ..chatId = json['chat_id'] as int
    ..content = json['chat_content'] as int
    ..senderId = json['sender_id'] as int
    ..chatType = json['chat_type'] as int
    ..receiveId = json['receive_id'] as int
    ..senderStatus = json['send_status'] as int
    ..chatTime = json['time'] as int
    ..chatTimeStr = json['chatTimeStr'] as String;
}

Map<String, dynamic> _$ChatInfoToJson(ChatInfo instance) => <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'chat_content': instance.content,
      'sender_id': instance.senderId,
      'chat_type': instance.chatType,
      'receive_id': instance.receiveId,
      'send_status': instance.senderStatus,
      'time': instance.chatTime,
      'chatTimeStr': instance.chatTimeStr,
    };

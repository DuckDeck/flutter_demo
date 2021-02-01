import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import '../Tool/Extension.dart';
part 'ChatInfo.g.dart';

@JsonSerializable()
@immutable
class ChatInfo {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "chat_id")
  int chatId;

  @JsonKey(name: "chat_content")
  int content;
  @JsonKey(name: "sender_id")
  int senderId;
  @JsonKey(name: "chat_type")
  int chatType;
  @JsonKey(name: "receive_id")
  int receiveId;
  @JsonKey(name: "send_status")
  int senderStatus;
  @JsonKey(name: "time")
  int chatTime;
  String chatTimeStr;
  // ignore: non_constant_identifier_names
  String get ChatTimeStr {
    return chatTime.toTime();
  }
  ChatInfo();
   factory ChatInfo.fromJson(Map<String, dynamic> json) =>
      _$ChatInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ChatInfoToJson(this);

}

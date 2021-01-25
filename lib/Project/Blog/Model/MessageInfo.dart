import 'package:dio/dio.dart';
import 'package:flutter_demo/Project/Blog/Model/ChatInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:flutter_demo/ResultInfo.dart';
import 'package:meta/meta.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MessageInfo.g.dart';

@JsonSerializable()
@immutable
class MessageInfo {
  @JsonKey(name: "sender_id")
  int senderId;
  @JsonKey(name: "receive_id")
  int receiveId;

  @JsonKey(name: "read_status")
  int readStatus;

  @JsonKey(name: "message_time")
  int messageTime;

  @JsonKey(name: "user_info")
  UserInfo userInfo;

  @JsonKey(name: "chat_info")
  ChatInfo chatInfo;

  Map<String, String> extraInfo;

  MessageInfo();
  factory MessageInfo.fromJson(Map<String, dynamic> json) =>
      _$MessageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageInfoToJson(this);

  static Future<ResultInfo> getMessage(int userId, int type, int index) async {
    var url =
        "$BaseUrl/message/listbytype/${type.toString()}/${userId.toString()}/${createToken()}/${index.toString()}/10";
        print(url);
    final dio = new Dio();
    final res = await dio.get(url);

    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    final datas = result.data as List<dynamic>;
    final messages = List<MessageInfo>();
    for (var item in datas) {
      final msg = MessageInfo.fromJson(item);
      var extraData = Map<String, String>();
      switch (type) {
        case 1: //评论
            extraData["comment_project_id"] = item["comment_project_id"].toString();
            extraData["comment_project_title"] = item["comment_project_title"];
            extraData["content"] = item["content"];
            break;
        case 2: //喜欢和赞
            extraData["comment_project_id"] = item["comment_project_id"].toString();
            extraData["comment_project_title"] = item["comment_project_title"];
          break;
        case 3: //关注
          break;
        default:
      }
      msg.extraInfo = extraData;
      messages.add(msg);
    }
    result.data = messages;
    return result;
  }
}

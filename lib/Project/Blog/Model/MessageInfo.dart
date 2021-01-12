import 'package:dio/dio.dart';
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

  Map<String,String> extraInfo;

  MessageInfo();
    factory MessageInfo.fromJson(Map<String, dynamic> json) =>
      _$MessageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageInfoToJson(this);

  static Future<ResultInfo> searchArticle(int userId,int type,int index) async{
    var url = "$BaseUrl/message/listbytype/${type.toString()}/${userId.toString()}/${createToken()}/${index.toString()}/10";
    final dio = new Dio();
    final res = await dio.get(url);
    
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
   
    return result;
  }

}
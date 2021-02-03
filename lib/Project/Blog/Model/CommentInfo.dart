import 'package:dio/dio.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:meta/meta.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_demo/ResultInfo.dart';
import '../Tool/Extension.dart';
part 'CommentInfo.g.dart';

@JsonSerializable()
@immutable
// ignore: must_be_immutable
class CommentInfo {
  @JsonKey(name: "comment_id")
  int id;

  @JsonKey(name: "comment_target_id")
  int targetId;

  @JsonKey(name: "comment_target_user_id")
  int targetUserId;

  @JsonKey(name: "comment_time")
  int commentTime;

  String get CommentTimeStr {
    return commentTime.toTime();
  }

  @JsonKey(name: "comment_content")
  String content;

  @JsonKey(name: "sub_comments")
  List<CommentInfo> subComments;

  @JsonKey(name: "userInfo")
  UserInfo userInfo;

  @JsonKey(name: "targetUserInfo")
  UserInfo targetUserInfo;

  CommentInfo();
  factory CommentInfo.fromJson(Map<String, dynamic> json) =>
      _$CommentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CommentInfoToJson(this);

  static Future<ResultInfo> getComments(int id, int index) async {
    var url = BaseUrl + "/articleComment/$id/$index/10";
    print(url);
    final dio = new Dio();
    final res = await dio.get(url);

    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    List<CommentInfo> arrComments = List<CommentInfo>();
    final arrs = result.data as List<dynamic>;
    for (var item in arrs) {
      final com = CommentInfo.fromJson(item);
      arrComments.add(com);
    }
    result.data = arrComments;
    return result;
  }

  static Future<ResultInfo> addComment(Map<String,dynamic> data) async {
    var url = BaseUrl + "/comment/${currentUser.id}/${createToken()}";
    print(url);
    final dio = new Dio();
    final res = await dio.post(url,data: data);
    final result = ResultInfo.toResult(res);
      return result;
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_demo/Project/4KImage/model.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/ResultInfo.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UserInfo.g.dart';
@JsonSerializable()
@immutable
class UserInfo {
  @JsonKey(name: "user_id")
  int id;

  @JsonKey(name: "user_real_name")
  String realName;

  @JsonKey(name: "article_count")
  int articleCount;
  
  @JsonKey(name: "comment_count")
  int commentCount;

  @JsonKey(name: "user_image_url")
  String headImage;


  @JsonKey(name: "user_address")
  String address;


  @JsonKey(name: "user_birthday")
  int birthday;


  @JsonKey(name: "user_description")
  String description;


  @JsonKey(name: "user_email")
  String email;


  @JsonKey(name: "user_gender")
  int gender;


  @JsonKey(name: "user_name")
  String userName;


  @JsonKey(name: "user_phone")
  String phone;


  @JsonKey(name: "user_qq")
  String qq;


  @JsonKey(name: "user_says")
  String says;


  String token;

    UserInfo();
    factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  static Future<ResultInfo> login(String username, String password) async {
    var url = BaseUrl + "/login";
    final dio = new Dio();
    final encryPass = encryptPassword(password);
    final data = {"userName":username,"password":encryPass};
    final res = await dio.post(url,data: data);
    final result = ResultInfo.toResult(res);
    if (result.code != 0) {
      return result;
    }
    final user = UserInfo.fromJson(result.data);
    result.data = user;
    saveUserInfo(user);
    currentUser = user;
    return result;
  }
}

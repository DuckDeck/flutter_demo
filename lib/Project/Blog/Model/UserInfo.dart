import 'package:dio/dio.dart';
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
  @JsonKey(name: "user_image_url")
  String headImage;


    UserInfo();
    factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

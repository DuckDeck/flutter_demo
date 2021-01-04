import 'package:dio/dio.dart';
import 'package:flutter_demo/Project/4KImage/model.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/ResultInfo.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UserLinkInfo.g.dart';
@JsonSerializable()
@immutable
class UserLinkInfo {
  @JsonKey(name: "link_user_id")
  int id;

  @JsonKey(name: "link_name")
  String name;

  @JsonKey(name: "link_url")
  String url;

  @JsonKey(name: "link_type")
  int type;

  UserLinkInfo();

  factory UserLinkInfo.fromJson(Map<String, dynamic> json) =>
      _$UserLinkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserLinkInfoToJson(this);
}
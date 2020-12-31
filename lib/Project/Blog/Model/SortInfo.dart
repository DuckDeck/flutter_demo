import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'SortInfo.g.dart';
@JsonSerializable()
@immutable
class SortInfo {
   @JsonKey(name: "sort_article_id")
  int id;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "sort_article_name")
  String sortName;
  SortInfo();
    factory SortInfo.fromJson(Map<String, dynamic> json) =>
      _$SortInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SortInfoToJson(this);

}
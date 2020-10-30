import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';

enum NoticeLevel { info, warning, error }

@JsonSerializable()
@immutable
class NoticeInfo {
  final String message;
  final NoticeLevel level;
  final Duration duration;

  NoticeInfo({
    this.message = '',
    this.level = NoticeLevel.error,
    this.duration = const Duration(seconds: 4),
  });

  factory NoticeInfo.fromJson(Map<String, dynamic> json) =>
      _$NoticeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeInfoToJson(this);
}

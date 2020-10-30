
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
class UserInfo {
  final int id;
  final String username;
  final String intro;
  final String avatar;
  final String mobile;
  final String email;
  final int postCount;
  final int likeCount;
  final int followingCount;
  final bool isFollowing;
  final DateTime createdAt;

  UserInfo({
    this.id = 0,
    this.username = '',
    this.intro = '',
    this.avatar = '',
    this.mobile = '',
    this.email = '',
    this.postCount = 0,
    this.likeCount = 0,
    this.followingCount = 0,
    this.isFollowing = false,
    DateTime createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  UserInfo copyWith({
    int id,
    String username,
    String intro,
    String avatar,
    String mobile,
    String email,
    int postCount,
    int likeCount,
    int followingCount,
    bool isFollowing,
    DateTime createdAt,
  }) =>
      UserInfo(
        id: id ?? this.id,
        username: username ?? this.username,
        intro: intro ?? this.intro,
        avatar: avatar ?? this.avatar,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        postCount: postCount ?? this.postCount,
        likeCount: likeCount ?? this.likeCount,
        followingCount: followingCount ?? this.followingCount,
        isFollowing: isFollowing ?? this.isFollowing,
        createdAt: createdAt ?? this.createdAt,
      );
}

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';


@JsonSerializable()
@immutable
class UserEntity {
  final int id;
  final String usernmae;
  final String intro;
  final String avatar;
  final String mobile;
  final String email;
  final int postCount;
  final int likeCount;
  final int followCount;
  final bool isFollowing;
  final DateTime createdAt;

  UserEntity({
    this.id = 0,
    this.usernmae = '',
    this.intro = '',
    this.avatar = '',
    this.mobile = '',
    this.email = '',
    this.postCount = 0,
    this.likeCount = 0,
    this.followCount = 0,
    this.isFollowing = false,
    DateTime createdAt,
  }) : this.createdAt = createdAt ?? DateTime.now();


  UserEntity copyWith({
     int id,
   String usernmae,
   String intro,
   String avatar,
   String mobile,
   String email,
   int postCount,
   int likeCount,
   int followCount,
   bool isFollowing,
   DateTime createdAt
  }) => UserEntity(id: id ?? this.id,
  usernmae: usernmae ?? this.usernmae,
  avatar: avatar ?? this.avatar,
  mobile: mobile??this.mobile,
  email: email??this.email,
  postCount: postCount??this.postCount,
  likeCount: likeCount??this.likeCount,
  followCount: followCount??this.followCount,
  isFollowing: isFollowing??this.isFollowing,
  createdAt: createdAt??this.createdAt
  );

     factory UserEntity.fromJson(Map<String,dynamic> json) => _$UserEntityFromJson(json);

    Map<String,dynamic> toJson() => _$UserEntityToJson(this);


}

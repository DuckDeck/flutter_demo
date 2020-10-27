import 'package:flutter_demo/Project/TimeShow/models/entity/user.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable()
@immutable
class UserState {
  final Map<String,UserEntity> users;
  final Map<String,List<int>> usersFollowing;
  final Map<String,List<int>> followers;

  UserState({
    this.users = const {},
    this.usersFollowing = const {},
    this.followers = const {}
  });

  UserState copyWith({
     Map<String,UserEntity> users,
   Map<String,List<int>> usersFollowing,
   Map<String,List<int>> followers
  }) => UserState(users: users ?? this.users,
  usersFollowing: usersFollowing ?? this.usersFollowing,
  followers: followers ?? this.followers);

    factory UserState.fromJson(Map<String,dynamic> json) => _$UserStateFromJson(json);
    Map<String,dynamic> toJson() => _$UserStateToJson(this);

}
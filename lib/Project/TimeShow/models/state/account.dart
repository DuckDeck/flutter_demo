import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/TimeShow/models/entity/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';
@JsonSerializable()
@immutable
class AccounState {
  final UserEntity user;

  AccounState({
    UserEntity user,
  }) : this.user = user ?? UserEntity();

  AccounState copyWith({UserEntity user}) => AccounState(user:user??this.user);


      factory AccounState.fromJson(Map<String,dynamic> json) => _$AccounStateFromJson(json);
    Map<String,dynamic> toJson() => _$AccounStateToJson(this);

}
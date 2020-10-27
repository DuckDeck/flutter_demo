import 'package:flutter_demo/Project/TimeShow/config.dart';
import 'package:flutter_demo/Project/TimeShow/models/state/account.dart';
import 'package:flutter_demo/Project/TimeShow/models/state/post.dart';
import 'package:flutter_demo/Project/TimeShow/models/state/publish.dart';
import 'package:flutter_demo/Project/TimeShow/models/state/user.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'app.g.dart';
@JsonSerializable()
@immutable
class AppState {
  final String version;
  final AccounState account;
  final PostState post;
  final PublishState publish;
  final UserState user;
  AppState({
    String version,
    AccounState account,
    PostState post,
    PublishState publish,
    UserState user
  }) : this.version = version ?? TsConfig.packageInfo.version,
  this.account = account ?? AccounState(),
  this.post = post ?? PostState(),
  this.publish = publish ?? PublishState(),
  this.user = user ?? UserState();


  AppState copyWith({
   String version,
   AccounState account,
   PostState post,
   PublishState publish,
   UserState user
  }) => AppState(
    version : version ?? this.version,
    account : account ?? this.account,
    post : post ?? this.post,
    publish : publish ?? this.publish,
    user : user ?? this.user
  );

  
}
import 'package:flutter_demo/Project/Blog/Model/state/home.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../config.dart';
import 'account.dart';


part 'app.g.dart';

@JsonSerializable()
@immutable
class AppState {
  final String version;
  final AccountState account;
  final HomePageState home;

  AppState({
    String version,
    AccountState account,
    HomePageState home
  })  : this.version = version ?? BlogConfig.packageInfo.version,
        this.account = account ?? AccountState(),
        this.home = home ?? HomePageState();
       

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  AppState copyWith({
    String version,
    AccountState account,
   
  }) =>
      AppState(
        version: version ?? this.version,
        account: account ?? this.account,
     
      );
}

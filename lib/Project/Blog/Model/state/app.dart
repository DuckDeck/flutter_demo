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


  AppState({
    String version,
    AccountState account,
  
  })  : this.version = version ?? BlogConfig.packageInfo.version,
        this.account = account ?? AccountState();
       

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

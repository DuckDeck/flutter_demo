import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/TimeShow/factory.dart';
import 'package:flutter_demo/Project/TimeShow/models/entity/notice.dart';
import 'package:flutter_demo/Project/TimeShow/models/entity/user.dart';
import 'package:flutter_demo/Project/TimeShow/models/form/account.dart';
import 'package:flutter_demo/Project/TimeShow/models/state/app.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AccountInfoAction {
  final UserEntity user;
  AccountInfoAction({
    @required this.user,
  });
}

ThunkAction<AppState> accountRegisterAction({
  @required RegisterForm form,
  void Function(UserEntity) onSucceed,
  void Function(NoticeEntity) onFailed
}) => (Store<AppState> store) async{
  final service = await Factory
};
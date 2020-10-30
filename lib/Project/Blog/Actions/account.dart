import 'package:flutter_demo/Project/Blog/Model/entity/notice.dart';
import 'package:flutter_demo/Project/Blog/Model/entity/user.dart';
import 'package:flutter_demo/Project/Blog/Model/form/account.dart';
import 'package:flutter_demo/Project/Blog/Model/state/app.dart';
import 'package:flutter_demo/Project/Blog/Service/service.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../factory.dart';


class AccountInfoAction {
  final UserInfo user;

  AccountInfoAction({
    @required this.user,
  });
}


ThunkAction<AppState> accountLoginAction({
  @required LoginForm form,
  void Function(UserInfo) onSucceed,
  void Function(NoticeInfo) onFailed,
}) =>
    (Store<AppState> store) async {
      final wgService = await BlogFactory().getService();
      final response = await wgService.post(
        '/account/login',
        data: form.toJson(),
      );
  
      if (response.code == ApiResponse.codeOk) {
        final user = UserInfo.fromJson(response.data['user']);
        store.dispatch(AccountInfoAction(user: user));
        if (onSucceed != null) onSucceed(user);
      } else {
        if (onFailed != null) onFailed(NoticeInfo(message: response.message));
      }
    };

ThunkAction<AppState> accountLogoutAction({
  void Function() onSucceed,
  void Function(NoticeInfo) onFailed,
}) =>
    (Store<AppState> store) async {
      final wgService = await BlogFactory().getService();
      final response = await wgService.get('/account/logout');

      if (response.code == ApiResponse.codeOk) {
        // store.dispatch(ResetStateAction());
        if (onSucceed != null) onSucceed();
      } else {
        if (onFailed != null) onFailed(NoticeInfo(message: response.message));
      }
    };

ThunkAction<AppState> accountInfoAction({
  void Function(UserInfo) onSucceed,
  void Function(NoticeInfo) onFailed,
}) =>
    (Store<AppState> store) async {
      final wgService = await BlogFactory().getService();
      final response = await wgService.get('/account/info');

      if (response.code == ApiResponse.codeOk) {
        final user = UserInfo.fromJson(response.data['user']);
        store.dispatch(AccountInfoAction(user: user));
        if (onSucceed != null) onSucceed(user);
      } else {
        if (onFailed != null) onFailed(NoticeInfo(message: response.message));
      }
    };


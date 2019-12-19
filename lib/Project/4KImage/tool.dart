import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'main_image_list.dart';
class ImgState {
  ImgState({this.userInfo, this.themeData, this.locale});
  UserInfo userInfo;
  ThemeData themeData;
  Locale locale;
}

ImgState appReducer(ImgState state,action){
  return ImgState(userInfo: UserReducer(state.userInfo,action),
  themeData: ThemeDataReducer(state.themeData,action),
  locale: LocaleReducer(state.locale,action));
}

class UpdateUserAction {
  final UserInfo userInfo;

  UpdateUserAction(this.userInfo);
}
UserInfo _updateLoaded(UserInfo user, action) {
  user = action.userInfo;
  return user;
}

final UserReducer = combineReducers<UserInfo>([
  TypedReducer<UserInfo, UpdateUserAction>(_updateLoaded),
]);

///通过 flutter_redux 的 combineReducers，实现 Reducer 方法
final ThemeDataReducer = combineReducers<ThemeData>([
  ///将 Action 、处理 Action 的方法、State 绑定
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

///定义处理 Action 行为的方法，返回新的 State
ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}

///定义一个 Action 类
///将该 Action 在 Reducer 中与处理该Action的方法绑定
class RefreshThemeDataAction {

  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);
}
final LocaleReducer = combineReducers<Locale>([
  TypedReducer<Locale, RefreshLocaleAction>(_refreshLocal),
]);

Locale _refreshLocal(Locale locale, RefreshLocaleAction action) {
  locale = action.locale;
  return locale;
}

class RefreshLocaleAction {
  final Locale locale;

  RefreshLocaleAction(this.locale);
}

class ImgReduxApp extends StatelessWidget {
  final store = Store<ImgState>(appReducer,initialState: ImgState(userInfo: UserInfo(),themeData: ThemeData(primaryColor: Colors.pink),locale: Locale("zh","CH")));
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store, child: MainImageList(),
    );
  }
}
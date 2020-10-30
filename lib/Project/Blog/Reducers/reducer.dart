import 'package:flutter_demo/Project/Blog/Model/state/app.dart';
import 'package:flutter_demo/Project/Blog/Reducers/account.dart';

AppState appReducer(AppState state,action){
  return state.copyWith(account:accountReducer(state.account,action));
}
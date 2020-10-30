import 'package:flutter_demo/Project/Blog/Actions/account.dart';
import 'package:flutter_demo/Project/Blog/Model/state/account.dart';
import 'package:redux/redux.dart';


final accountReducer = combineReducers<AccountState>([
  TypedReducer<AccountState, AccountInfoAction>(_accountInfo),
]);

AccountState _accountInfo(AccountState state, AccountInfoAction action) {
  return state.copyWith(
    user: action.user,
  );
}

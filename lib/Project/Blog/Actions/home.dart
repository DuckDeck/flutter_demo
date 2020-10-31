import 'package:flutter_demo/Project/Blog/Model/entity/banner.dart';
import 'package:flutter_demo/Project/Blog/Model/entity/notice.dart';
import 'package:flutter_demo/Project/Blog/Model/state/app.dart';
import 'package:flutter_demo/Project/Blog/Service/service.dart';
import 'package:flutter_demo/Project/Blog/factory.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';


class HomeInfoAction {
  final List<BannerInfo> banners;

  HomeInfoAction({
    @required this.banners,
  });
}

ThunkAction<AppState> getHomeInfoAction({ void Function(BannerInfo) onSucceed,
  void Function(NoticeInfo) onFailed,}) => (Store<AppState> store )async {
      final service = await BlogFactory().getService();
      final res = await service.get('/index');
      if (res.code == ApiResponse.codeOk){
          print(res.data);
      }
  };
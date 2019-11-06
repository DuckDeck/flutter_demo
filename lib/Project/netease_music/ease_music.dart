import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/netease_music/pages/splash_page.dart';
import 'package:flutter_demo/Project/netease_music/provider/play_songs_model.dart';
import 'package:flutter_demo/Project/netease_music/provider/user_model.dart';
import 'package:flutter_demo/Project/netease_music/route/navigate_service.dart';
import 'package:flutter_demo/Project/netease_music/route/routes.dart';
import 'package:flutter_demo/Project/netease_music/utils/net_utils.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'utils/log_util.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  NetUtils.init();
  Application.setupLocator();
  LogUtil.init(tag: 'NETEASE_MUSIC');
//  AudioPlayer.logEnabled = true;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserModel>.value(
        value: UserModel(),
      ),
      ChangeNotifierProvider<PlaySongsModel>(
        builder: (_) => PlaySongsModel()..init(),
      ),
    ],
    child: Ease_Music(),
  ));
}

class Ease_Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Application.getIt<NavigateService>().key,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        splashColor: Colors.transparent,
      ),
      home: SplashPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
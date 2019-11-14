import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
// import 'package:flutter_demo/Project/netease_music/provider/user_model.dart';
// import 'package:flutter_demo/Project/netease_music/route/navigate_service.dart';
// import 'package:flutter_demo/Project/netease_music/route/routes.dart';
// import 'package:flutter_demo/Project/netease_music/application.dart';
// import 'package:flutter_demo/Project/netease_music/utils/net_utils.dart';
// import 'package:flutter_demo/Project/netease_music/utils/log_util.dart';
// import 'package:flutter_demo/Project/netease_music/pages/splash_page.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_demo/Project/netease_music/provider/play_songs_model.dart';
const items = [
  "Novel小说","云音乐"
];

class ProjectListPage extends StatefulWidget {
  _ProjectListPageState createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("完整项目列表"),),
        body: ListView.builder(itemBuilder: (BuildContext context,int index){
          return GestureDetector(
            onTap: (){
              gotoPage(index,context);
            },
            child: ListTile(title: Text(items[index]),),
          );
        },
        itemCount: items.length,),
        );
      
  }
void gotoPage(int index,BuildContext context) {
      print(index);
      switch (index) {
        case 0:
             Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
          
              }));
          break;
          case 0:
          //    Router router = Router();
          //   Routes.configureRoutes(router);
          //   Application.router = router;
          //   NetUtils.init();
          //   Application.setupLocator();
          //   LogUtil.init(tag: 'NETEASE_MUSIC');

          // var pro =  MultiProvider(
          //   providers: [
          //     ChangeNotifierProvider<UserModel>.value(
          //       value: UserModel(),
          //     ),
          //     ChangeNotifierProvider<PlaySongsModel>(
          //       builder: (_) => PlaySongsModel()..init(),
          //     ),
          //   ],
          //   child: Ease_Music(),
          // );
          //     Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
          //         return pro;
          //     }));
          break;
        default:
      }
  }
  
}

// class Ease_Music extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       navigatorKey: Application.getIt<NavigateService>().key,
//       theme: ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Colors.white,
//         splashColor: Colors.transparent,
//       ),
//       home: SplashPage(),
//       onGenerateRoute: Application.router.generator,
//     );
//   }
// }
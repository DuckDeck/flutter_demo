import 'package:flutter/material.dart';
import 'package:flutter_demo/Foundation/Reflect.dart';
import 'package:flutter_demo/Foundation/menu.dart';
import 'package:flutter_demo/Project/4KImage/main_image_list.dart';
import 'package:flutter_demo/Project/Blog/blogLogin.dart';
import 'package:flutter_demo/Project/Blog/blogSetting.dart';
import 'package:flutter_demo/Project/Blog/blogWebview.dart';
import 'package:flutter_demo/Project/Blog/main.dart';
import 'package:flutter_demo/Project/Blog/articleDetail.dart';
import 'package:flutter_demo/Project/Blog/myMessage.dart';
import 'package:flutter_demo/Project/Blog/userInfo.dart';
import 'package:flutter_demo/Project/Five/main.dart';
import 'package:flutter_demo/Project/menu.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      builder: (BuildContext context, Widget child) {
        return FlutterEasyLoading(child: child);
      },
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new HomePage(),
        '/foundation': (BuildContext context) => new FoundationMenuPage(),
        '/foundation/reflect': (BuildContext context) => new Reflect(),
        '/project': (BuildContext context) => new ProjectMenuPage(),
        '/project/mito': (BuildContext context) => new MainImageList(),
        '/project/five': (BuildContext context) => new FiveStrokePage(),
        '/project/blog': (BuildContext context) => new ZoeBlogPage(),
        '/project/blog/article': (BuildContext context) =>
            new ArticleDetailPage(
                info: ModalRoute.of(context).settings.arguments),
        '/project/blog/login': (BuildContext context) => new BlogLoginPage(),
        '/project/blog/userinfo': (BuildContext context) => new UserInfoPage(
              targetUserInfo: ModalRoute.of(context).settings.arguments,
            ),
        '/project/blog/web': (BuildContext context) => new BlogWebviewPage(
              url: ModalRoute.of(context).settings.arguments,
            ),
        '/project/blog/message': (BuildContext context) => new MyMessagePage(),
        '/project/blog/setting': (BuildContext context) =>
            new BlogSettingPage(),
      },
    );
  }
}

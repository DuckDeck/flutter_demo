import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/state/app.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/Project/Blog/factory.dart';
import 'package:flutter_demo/Project/Blog/main.dart';
import 'package:flutter_demo/Project/Blog/theme.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


class BlogApp extends StatelessWidget {
  final logger = BlogFactory().getLogger("app");
  final Store<AppState> store;
  
BlogApp(this.store){
  logger.info( 'WgConfig(debug: ${BlogConfig.debug}, loggerLevel: ${BlogConfig.loggerLevel})');
}
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(store: store,
      child: MaterialApp(
        title: BlogConfig.packageInfo.appName,
        theme: BlogTheme.theme,
        routes: {
          '/':(context)=> HomeBlogPage()
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/app.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/Project/Blog/factory.dart';
import 'package:package_info/package_info.dart';

void startBlogApp() async{
  BlogConfig.packageInfo = await PackageInfo.fromPlatform();
  final store = await BlogFactory().getStore();
  runApp(BlogApp(store));
}
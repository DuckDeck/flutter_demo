import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
import 'package:path_provider/path_provider.dart';

const BaseUrl = "http://api.bqbbq.com/api";
UserInfo currentUser ;
  Future<File> getDataFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    var path = Directory(dir + "/" + "blog");
    if (!path.existsSync()) {
      path.createSync();
    }
    final filePath = path.path + "/" + "blog.text";
    return new File(filePath);
  }

    Future<UserInfo> getFives() async {
    final file = await getDataFile();
    final contents = await file.readAsString();
    
    dynamic item = jsonDecode(contents);
 
    final userInfo = UserInfo.fromJson(item);
    return userInfo;
  }

  void saveFives(UserInfo userInfo) async {
    final file = await getDataFile();
    final data = jsonEncode(userInfo);
    file.writeAsString(data);
  }
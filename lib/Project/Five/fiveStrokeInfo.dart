
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_demo/Foundation/Reflect.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fiveStrokeInfo.g.dart';
@JsonSerializable()
@immutable

class FiveStrokeInfo {
  @JsonKey(name: "ID")
  final int  id ;
  @JsonKey(name: "Word")
  final String text ;
  @JsonKey(name: "PinYin")
  final String pinyin; 
  @JsonKey(name: "ImgCode")
  final String img ;
  @JsonKey(name: "FiveCode")
  final String code ;
  FiveStrokeInfo({
    this.id = 0,this.text = "",this.pinyin = "",this.img = "",this.code = ""
  });
  factory FiveStrokeInfo.fromJson(Map<String, dynamic> json) =>
      _$FiveStrokeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$FiveStrokeInfoToJson(this);


  static Future<ResultInfo> getFiveStroke(String words) async  {
     var resData = ResultInfo();
     Dio dio = Dio();
     Response res = await dio.get("http://lovelive.ink:7110/five/" + words);
     if(res.statusCode != 200){
       resData.code =  res.statusCode - 500;
       resData.msg =  res.statusMessage;
       return resData;
     }
     print(res.data.runtimeType);
     Map<String,dynamic> data = res.data;
     resData.code = data["code"] as int;
     resData.msg = data["msg"] as String;
     resData.data = data["data"];
     if(resData.code != 0){
        return  resData;
     }
     List<dynamic> items = resData.data;
     List<FiveStrokeInfo> fives = List<FiveStrokeInfo>();
     for (var item in items) {
       final five = FiveStrokeInfo.fromJson(item);
       fives.add(five);
     }
    resData.data = fives;
     return  resData;
  }

}

class ResultInfo {
  var code = 0;
  var msg = "";
  dynamic data; 
}


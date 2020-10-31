import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/entity/banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home.g.dart';
@JsonSerializable()
@immutable
class HomePageState {
  @JsonKey(name: "top")
  final List<BannerInfo> banners;

  HomePageState({this.banners =const []});  


  factory HomePageState.fromJson(Map<String, dynamic> json) =>
      _$HomePageStateFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageStateToJson(this);
}
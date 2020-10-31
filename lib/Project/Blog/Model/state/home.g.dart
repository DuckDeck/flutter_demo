// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageState _$HomePageStateFromJson(Map<String, dynamic> json) {
  return HomePageState(
    banners: (json['top'] as List)
        ?.map((e) =>
            e == null ? null : BannerInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomePageStateToJson(HomePageState instance) =>
    <String, dynamic>{
      'top': instance.banners,
    };

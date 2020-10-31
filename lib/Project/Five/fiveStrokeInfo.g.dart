// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiveStrokeInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiveStrokeInfo _$FiveStrokeInfoFromJson(Map<String, dynamic> json) {
  return FiveStrokeInfo(
    id: json['ID'] as int,
    text: json['Word'] as String,
    pinyin: json['PinYin'] as String,
    img: json['ImgCode'] as String,
    code: json['FiveCode'] as String,
  );
}

Map<String, dynamic> _$FiveStrokeInfoToJson(FiveStrokeInfo instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Word': instance.text,
      'PinYin': instance.pinyin,
      'ImgCode': instance.img,
      'FiveCode': instance.code,
    };

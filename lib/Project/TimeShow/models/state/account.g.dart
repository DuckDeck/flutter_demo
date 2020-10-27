// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccounState _$AccounStateFromJson(Map<String, dynamic> json) {
  return AccounState(
    user: json['user'] == null
        ? null
        : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccounStateToJson(AccounState instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

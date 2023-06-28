// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WxUser _$WxUserFromJson(Map<String, dynamic> json) => WxUser(
      success: json['success'] as bool?,
      resultCode: json['resultCode'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$WxUserToJson(WxUser instance) => <String, dynamic>{
      'success': instance.success,
      'resultCode': instance.resultCode,
      'data': instance.data,
      'dateTime': instance.dateTime,
    };

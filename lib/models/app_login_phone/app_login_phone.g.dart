// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_login_phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppLoginPhone _$AppLoginPhoneFromJson(Map<String, dynamic> json) =>
    AppLoginPhone(
      success: json['success'] as bool?,
      resultCode: json['resultCode'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$AppLoginPhoneToJson(AppLoginPhone instance) =>
    <String, dynamic>{
      'success': instance.success,
      'resultCode': instance.resultCode,
      'data': instance.data,
      'dateTime': instance.dateTime,
    };

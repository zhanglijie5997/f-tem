// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms_send_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmsSendCodeModel _$SmsSendCodeModelFromJson(Map<String, dynamic> json) =>
    SmsSendCodeModel(
      success: json['success'] as bool?,
      resultCode: json['resultCode'] as String?,
      message: json['message'] as String?,
      data: json['data'],
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$SmsSendCodeModelToJson(SmsSendCodeModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'resultCode': instance.resultCode,
      'message': instance.message,
      'data': instance.data,
      'dateTime': instance.dateTime,
    };

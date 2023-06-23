// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annocument_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnocumentDetail _$AnnocumentDetailFromJson(Map<String, dynamic> json) =>
    AnnocumentDetail(
      success: json['success'] as bool?,
      resultCode: json['resultCode'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$AnnocumentDetailToJson(AnnocumentDetail instance) =>
    <String, dynamic>{
      'success': instance.success,
      'resultCode': instance.resultCode,
      'data': instance.data,
      'dateTime': instance.dateTime,
    };

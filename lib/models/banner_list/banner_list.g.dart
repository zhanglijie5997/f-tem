// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerList _$BannerListFromJson(Map<String, dynamic> json) => BannerList(
      success: json['success'] as bool?,
      resultCode: json['resultCode'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$BannerListToJson(BannerList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'resultCode': instance.resultCode,
      'data': instance.data,
      'dateTime': instance.dateTime,
    };

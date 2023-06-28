// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_market_get_plat_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftMarketGetPlatList _$NftMarketGetPlatListFromJson(
        Map<String, dynamic> json) =>
    NftMarketGetPlatList(
      success: json['success'] as bool?,
      resultCode: json['resultCode'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$NftMarketGetPlatListToJson(
        NftMarketGetPlatList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'resultCode': instance.resultCode,
      'data': instance.data,
      'dateTime': instance.dateTime,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_home_page_recommend_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftHomePageRecommendList _$NftHomePageRecommendListFromJson(
        Map<String, dynamic> json) =>
    NftHomePageRecommendList(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$NftHomePageRecommendListToJson(
        NftHomePageRecommendList instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'total': instance.total,
    };

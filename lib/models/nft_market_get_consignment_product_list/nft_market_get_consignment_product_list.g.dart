// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_market_get_consignment_product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftMarketGetConsignmentProductList _$NftMarketGetConsignmentProductListFromJson(
        Map<String, dynamic> json) =>
    NftMarketGetConsignmentProductList(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$NftMarketGetConsignmentProductListToJson(
        NftMarketGetConsignmentProductList instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'total': instance.total,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_get_product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductGetProductList _$ProductGetProductListFromJson(
        Map<String, dynamic> json) =>
    ProductGetProductList(
      success: json['success'] as bool?,
      resultCode: json['resultCode'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$ProductGetProductListToJson(
        ProductGetProductList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'resultCode': instance.resultCode,
      'data': instance.data,
      'dateTime': instance.dateTime,
    };

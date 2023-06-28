// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Row _$RowFromJson(Map<String, dynamic> json) => Row(
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      productCover: json['productCover'] as String?,
      series: json['series'] as String?,
      issueNumber: json['issueNumber'] as int?,
      circulateNumber: json['circulateNumber'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      isHide: json['isHide'] as int?,
    );

Map<String, dynamic> _$RowToJson(Row instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'productCover': instance.productCover,
      'series': instance.series,
      'issueNumber': instance.issueNumber,
      'circulateNumber': instance.circulateNumber,
      'price': instance.price,
      'isHide': instance.isHide,
    };

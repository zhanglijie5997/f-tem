// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      productId: json['productId'] as String?,
      productMintId: json['productMintId'] as String?,
      productName: json['productName'] as String?,
      productCover: json['productCover'] as String?,
      productImage: json['productImage'] as String?,
      sumNumber: json['sumNumber'] as int?,
      consignmentNumber: json['consignmentNumber'] as int?,
      synthesisStatus: json['synthesisStatus'] as int?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'productId': instance.productId,
      'productMintId': instance.productMintId,
      'productName': instance.productName,
      'productCover': instance.productCover,
      'productImage': instance.productImage,
      'sumNumber': instance.sumNumber,
      'consignmentNumber': instance.consignmentNumber,
      'synthesisStatus': instance.synthesisStatus,
    };

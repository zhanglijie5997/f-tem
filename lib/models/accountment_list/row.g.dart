// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Row _$RowFromJson(Map<String, dynamic> json) => Row(
      id: json['id'] as String?,
      typeName: json['typeName'],
      title: json['title'] as String?,
      publishTime: json['publishTime'] as String?,
      imgUrl: json['imgUrl'] as String?,
      readFlag: json['readFlag'] as int?,
    );

Map<String, dynamic> _$RowToJson(Row instance) => <String, dynamic>{
      'id': instance.id,
      'typeName': instance.typeName,
      'title': instance.title,
      'publishTime': instance.publishTime,
      'imgUrl': instance.imgUrl,
      'readFlag': instance.readFlag,
    };

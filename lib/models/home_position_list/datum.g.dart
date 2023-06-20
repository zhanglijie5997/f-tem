// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      current: json['current'] as int?,
      rows: json['rows'] as int?,
      id: json['id'] as String?,
      createDate: json['createDate'] as String?,
      updateDate: json['updateDate'] as String?,
      createBy: json['createBy'] as String?,
      updateBy: json['updateBy'] as String?,
      delFlag: json['delFlag'] as bool?,
      name: json['name'] as String?,
      logoImg: json['logoImg'] as String?,
      sortChart: json['sortChart'] as int?,
      pageType: json['pageType'] as int?,
      redirectUrl: json['redirectUrl'] as String?,
      state: json['state'] as int?,
      userId: json['userId'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'current': instance.current,
      'rows': instance.rows,
      'id': instance.id,
      'createDate': instance.createDate,
      'updateDate': instance.updateDate,
      'createBy': instance.createBy,
      'updateBy': instance.updateBy,
      'delFlag': instance.delFlag,
      'name': instance.name,
      'logoImg': instance.logoImg,
      'sortChart': instance.sortChart,
      'pageType': instance.pageType,
      'redirectUrl': instance.redirectUrl,
      'state': instance.state,
      'userId': instance.userId,
    };

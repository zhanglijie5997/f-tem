// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      plateId: json['plateId'] as String?,
      name: json['name'] as String?,
      labelStr: json['labelStr'] as String?,
      label: json['label'] as int?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'plateId': instance.plateId,
      'name': instance.name,
      'labelStr': instance.labelStr,
      'label': instance.label,
    };

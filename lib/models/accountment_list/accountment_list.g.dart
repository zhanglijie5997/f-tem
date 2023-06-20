// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountment_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountmentList _$AccountmentListFromJson(Map<String, dynamic> json) =>
    AccountmentList(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$AccountmentListToJson(AccountmentList instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'total': instance.total,
    };

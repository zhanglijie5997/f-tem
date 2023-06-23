// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_home_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftHomeCalendar _$NftHomeCalendarFromJson(Map<String, dynamic> json) =>
    NftHomeCalendar(
      rows: (json['rows'] as List<dynamic>?)
          ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$NftHomeCalendarToJson(NftHomeCalendar instance) =>
    <String, dynamic>{
      'rows': instance.rows,
      'total': instance.total,
    };

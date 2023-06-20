import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'banner_list.g.dart';

@JsonSerializable()
class BannerList extends Equatable {
  final bool? success;
  final String? resultCode;
  final List<Datum>? data;
  final String? dateTime;

  const BannerList({
    this.success,
    this.resultCode,
    this.data,
    this.dateTime,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) {
    return _$BannerListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BannerListToJson(this);

  BannerList copyWith({
    bool? success,
    String? resultCode,
    List<Datum>? data,
    String? dateTime,
  }) {
    return BannerList(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [success, resultCode, data, dateTime];
}

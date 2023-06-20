import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'home_position_list.g.dart';

@JsonSerializable()
class HomePositionList extends Equatable {
  final bool? success;
  final String? resultCode;
  final List<Datum>? data;
  final String? dateTime;

  const HomePositionList({
    this.success,
    this.resultCode,
    this.data,
    this.dateTime,
  });

  factory HomePositionList.fromJson(Map<String, dynamic> json) {
    return _$HomePositionListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HomePositionListToJson(this);

  HomePositionList copyWith({
    bool? success,
    String? resultCode,
    List<Datum>? data,
    String? dateTime,
  }) {
    return HomePositionList(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [success, resultCode, data, dateTime];
}

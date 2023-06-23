import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'annocument_detail.g.dart';

@JsonSerializable()
class AnnocumentDetail extends Equatable {
  final bool? success;
  final String? resultCode;
  final Data? data;
  final String? dateTime;

  const AnnocumentDetail({
    this.success,
    this.resultCode,
    this.data,
    this.dateTime,
  });

  factory AnnocumentDetail.fromJson(Map<String, dynamic> json) {
    return _$AnnocumentDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnnocumentDetailToJson(this);

  AnnocumentDetail copyWith({
    bool? success,
    String? resultCode,
    Data? data,
    String? dateTime,
  }) {
    return AnnocumentDetail(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [success, resultCode, data, dateTime];
}

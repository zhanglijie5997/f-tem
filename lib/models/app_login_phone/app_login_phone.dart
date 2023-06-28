import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'app_login_phone.g.dart';

@JsonSerializable()
class AppLoginPhone extends Equatable {
  final bool? success;
  final String? resultCode;
  final Data? data;
  final String? dateTime;

  const AppLoginPhone({
    this.success,
    this.resultCode,
    this.data,
    this.dateTime,
  });

  factory AppLoginPhone.fromJson(Map<String, dynamic> json) {
    return _$AppLoginPhoneFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppLoginPhoneToJson(this);

  AppLoginPhone copyWith({
    bool? success,
    String? resultCode,
    Data? data,
    String? dateTime,
  }) {
    return AppLoginPhone(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [success, resultCode, data, dateTime];
}

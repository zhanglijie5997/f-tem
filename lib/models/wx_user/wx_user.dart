import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'wx_user.g.dart';

@JsonSerializable()
class WxUser extends Equatable {
  final bool? success;
  final String? resultCode;
  final Data? data;
  final String? dateTime;

  const WxUser({this.success, this.resultCode, this.data, this.dateTime});

  factory WxUser.fromJson(Map<String, dynamic> json) {
    return _$WxUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WxUserToJson(this);

  WxUser copyWith({
    bool? success,
    String? resultCode,
    Data? data,
    String? dateTime,
  }) {
    return WxUser(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [success, resultCode, data, dateTime];
}

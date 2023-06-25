import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sms_send_code_model.g.dart';

@JsonSerializable()
class SmsSendCodeModel extends Equatable {
  final bool? success;
  final String? resultCode;
  final String? message;
  final dynamic data;
  final String? dateTime;

  const SmsSendCodeModel({
    this.success,
    this.resultCode,
    this.message,
    this.data,
    this.dateTime,
  });

  factory SmsSendCodeModel.fromJson(Map<String, dynamic> json) {
    return _$SmsSendCodeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SmsSendCodeModelToJson(this);

  SmsSendCodeModel copyWith({
    bool? success,
    String? resultCode,
    String? message,
    dynamic data,
    String? dateTime,
  }) {
    return SmsSendCodeModel(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      message: message ?? this.message,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props {
    return [
      success,
      resultCode,
      message,
      data,
      dateTime,
    ];
  }
}

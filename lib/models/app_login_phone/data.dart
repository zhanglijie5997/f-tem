import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? userId;
  final String? userName;
  final String? token;
  final String? publicKey;

  const Data({this.userId, this.userName, this.token, this.publicKey});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? userId,
    String? userName,
    String? token,
    String? publicKey,
  }) {
    return Data(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      token: token ?? this.token,
      publicKey: publicKey ?? this.publicKey,
    );
  }

  @override
  List<Object?> get props => [userId, userName, token, publicKey];
}

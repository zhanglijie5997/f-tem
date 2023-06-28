// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      token: json['token'] as String?,
      publicKey: json['publicKey'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'token': instance.token,
      'publicKey': instance.publicKey,
    };

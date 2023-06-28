import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'nft_market_get_plat_list.g.dart';

@JsonSerializable()
class NftMarketGetPlatList extends Equatable {
  final bool? success;
  final String? resultCode;
  final List<Datum>? data;
  final String? dateTime;

  const NftMarketGetPlatList({
    this.success,
    this.resultCode,
    this.data,
    this.dateTime,
  });

  factory NftMarketGetPlatList.fromJson(Map<String, dynamic> json) {
    return _$NftMarketGetPlatListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NftMarketGetPlatListToJson(this);

  NftMarketGetPlatList copyWith({
    bool? success,
    String? resultCode,
    List<Datum>? data,
    String? dateTime,
  }) {
    return NftMarketGetPlatList(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [success, resultCode, data, dateTime];
}

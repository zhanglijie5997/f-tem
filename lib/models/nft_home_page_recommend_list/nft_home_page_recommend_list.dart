import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'row.dart';

part 'nft_home_page_recommend_list.g.dart';

@JsonSerializable()
class NftHomePageRecommendList extends Equatable {
  final List<Row>? rows;
  final int? total;

  const NftHomePageRecommendList({this.rows, this.total});

  factory NftHomePageRecommendList.fromJson(Map<String, dynamic> json) {
    return _$NftHomePageRecommendListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NftHomePageRecommendListToJson(this);

  NftHomePageRecommendList copyWith({
    List<Row>? rows,
    int? total,
  }) {
    return NftHomePageRecommendList(
      rows: rows ?? this.rows,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props => [rows, total];
}

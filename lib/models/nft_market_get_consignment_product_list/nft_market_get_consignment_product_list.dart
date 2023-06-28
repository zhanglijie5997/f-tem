import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'row.dart';

part 'nft_market_get_consignment_product_list.g.dart';

@JsonSerializable()
class NftMarketGetConsignmentProductList extends Equatable {
  final List<Row>? rows;
  final int? total;

  const NftMarketGetConsignmentProductList({this.rows, this.total});

  factory NftMarketGetConsignmentProductList.fromJson(
      Map<String, dynamic> json) {
    return _$NftMarketGetConsignmentProductListFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NftMarketGetConsignmentProductListToJson(this);
  }

  NftMarketGetConsignmentProductList copyWith({
    List<Row>? rows,
    int? total,
  }) {
    return NftMarketGetConsignmentProductList(
      rows: rows ?? this.rows,
      total: total ?? this.total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [rows, total];
}

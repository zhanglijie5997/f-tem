import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'product_get_product_list.g.dart';

@JsonSerializable()
class ProductGetProductList extends Equatable {
  final bool? success;
  final String? resultCode;
  final List<Datum>? data;
  final String? dateTime;

  const ProductGetProductList({
    this.success,
    this.resultCode,
    this.data,
    this.dateTime,
  });

  factory ProductGetProductList.fromJson(Map<String, dynamic> json) {
    return _$ProductGetProductListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductGetProductListToJson(this);

  ProductGetProductList copyWith({
    bool? success,
    String? resultCode,
    List<Datum>? data,
    String? dateTime,
  }) {
    return ProductGetProductList(
      success: success ?? this.success,
      resultCode: resultCode ?? this.resultCode,
      data: data ?? this.data,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object?> get props => [success, resultCode, data, dateTime];
}

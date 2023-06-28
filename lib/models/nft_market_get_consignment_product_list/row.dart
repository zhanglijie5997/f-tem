import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'row.g.dart';

@JsonSerializable()
class Row extends Equatable {
  final String? productId;
  final String? productName;
  final String? productCover;
  final String? series;
  final int? issueNumber;
  final int? circulateNumber;
  final double? price;
  final int? isHide;

  const Row({
    this.productId,
    this.productName,
    this.productCover,
    this.series,
    this.issueNumber,
    this.circulateNumber,
    this.price,
    this.isHide,
  });

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);

  Map<String, dynamic> toJson() => _$RowToJson(this);

  Row copyWith({
    String? productId,
    String? productName,
    String? productCover,
    String? series,
    int? issueNumber,
    int? circulateNumber,
    double? price,
    int? isHide,
  }) {
    return Row(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productCover: productCover ?? this.productCover,
      series: series ?? this.series,
      issueNumber: issueNumber ?? this.issueNumber,
      circulateNumber: circulateNumber ?? this.circulateNumber,
      price: price ?? this.price,
      isHide: isHide ?? this.isHide,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productId,
      productName,
      productCover,
      series,
      issueNumber,
      circulateNumber,
      price,
      isHide,
    ];
  }
}

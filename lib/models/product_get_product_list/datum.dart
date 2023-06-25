import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  final String? productId;
  final String? productMintId;
  final String? productName;
  final String? productCover;
  final String? productImage;
  final int? sumNumber;
  final int? consignmentNumber;
  final int? synthesisStatus;

  const Datum({
    this.productId,
    this.productMintId,
    this.productName,
    this.productCover,
    this.productImage,
    this.sumNumber,
    this.consignmentNumber,
    this.synthesisStatus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    String? productId,
    String? productMintId,
    String? productName,
    String? productCover,
    String? productImage,
    int? sumNumber,
    int? consignmentNumber,
    int? synthesisStatus,
  }) {
    return Datum(
      productId: productId ?? this.productId,
      productMintId: productMintId ?? this.productMintId,
      productName: productName ?? this.productName,
      productCover: productCover ?? this.productCover,
      productImage: productImage ?? this.productImage,
      sumNumber: sumNumber ?? this.sumNumber,
      consignmentNumber: consignmentNumber ?? this.consignmentNumber,
      synthesisStatus: synthesisStatus ?? this.synthesisStatus,
    );
  }

  @override
  List<Object?> get props {
    return [
      productId,
      productMintId,
      productName,
      productCover,
      productImage,
      sumNumber,
      consignmentNumber,
      synthesisStatus,
    ];
  }
}

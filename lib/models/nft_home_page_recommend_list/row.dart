import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'row.g.dart';

@JsonSerializable()
class Row extends Equatable {
  final int? current;
  final int? rows;
  final String? id;
  final String? createDate;
  final String? updateDate;
  final String? createBy;
  final String? updateBy;
  final bool? delFlag;
  final String? nftProductId;
  final int? position;
  final int? isRecommend;
  final dynamic recommendDate;
  final int? sortInt;
  final String? remark;
  final String? productName;
  final String? productImage;
  final String? productCover;
  final int? productMintNumber;
  final double? productPrice;
  final String? productCreatorId;
  final String? productCreatorNickName;
  final String? productCreatorAvatar;
  final dynamic productCreatorIntroduce;
  final dynamic brandPartyName;
  final dynamic brandPartyIntroduce;
  final dynamic supervisorName;
  final dynamic supervisorIntroduce;
  final int? isTransfer;
  final dynamic activity;

  const Row({
    this.current,
    this.rows,
    this.id,
    this.createDate,
    this.updateDate,
    this.createBy,
    this.updateBy,
    this.delFlag,
    this.nftProductId,
    this.position,
    this.isRecommend,
    this.recommendDate,
    this.sortInt,
    this.remark,
    this.productName,
    this.productImage,
    this.productCover,
    this.productMintNumber,
    this.productPrice,
    this.productCreatorId,
    this.productCreatorNickName,
    this.productCreatorAvatar,
    this.productCreatorIntroduce,
    this.brandPartyName,
    this.brandPartyIntroduce,
    this.supervisorName,
    this.supervisorIntroduce,
    this.isTransfer,
    this.activity,
  });

  factory Row.fromJson(Map<String, dynamic> json) => _$RowFromJson(json);

  Map<String, dynamic> toJson() => _$RowToJson(this);

  Row copyWith({
    int? current,
    int? rows,
    String? id,
    String? createDate,
    String? updateDate,
    String? createBy,
    String? updateBy,
    bool? delFlag,
    String? nftProductId,
    int? position,
    int? isRecommend,
    dynamic recommendDate,
    int? sortInt,
    String? remark,
    String? productName,
    String? productImage,
    String? productCover,
    int? productMintNumber,
    double? productPrice,
    String? productCreatorId,
    String? productCreatorNickName,
    String? productCreatorAvatar,
    dynamic productCreatorIntroduce,
    dynamic brandPartyName,
    dynamic brandPartyIntroduce,
    dynamic supervisorName,
    dynamic supervisorIntroduce,
    int? isTransfer,
    dynamic activity,
  }) {
    return Row(
      current: current ?? this.current,
      rows: rows ?? this.rows,
      id: id ?? this.id,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      createBy: createBy ?? this.createBy,
      updateBy: updateBy ?? this.updateBy,
      delFlag: delFlag ?? this.delFlag,
      nftProductId: nftProductId ?? this.nftProductId,
      position: position ?? this.position,
      isRecommend: isRecommend ?? this.isRecommend,
      recommendDate: recommendDate ?? this.recommendDate,
      sortInt: sortInt ?? this.sortInt,
      remark: remark ?? this.remark,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      productCover: productCover ?? this.productCover,
      productMintNumber: productMintNumber ?? this.productMintNumber,
      productPrice: productPrice ?? this.productPrice,
      productCreatorId: productCreatorId ?? this.productCreatorId,
      productCreatorNickName:
          productCreatorNickName ?? this.productCreatorNickName,
      productCreatorAvatar: productCreatorAvatar ?? this.productCreatorAvatar,
      productCreatorIntroduce:
          productCreatorIntroduce ?? this.productCreatorIntroduce,
      brandPartyName: brandPartyName ?? this.brandPartyName,
      brandPartyIntroduce: brandPartyIntroduce ?? this.brandPartyIntroduce,
      supervisorName: supervisorName ?? this.supervisorName,
      supervisorIntroduce: supervisorIntroduce ?? this.supervisorIntroduce,
      isTransfer: isTransfer ?? this.isTransfer,
      activity: activity ?? this.activity,
    );
  }

  @override
  List<Object?> get props {
    return [
      current,
      rows,
      id,
      createDate,
      updateDate,
      createBy,
      updateBy,
      delFlag,
      nftProductId,
      position,
      isRecommend,
      recommendDate,
      sortInt,
      remark,
      productName,
      productImage,
      productCover,
      productMintNumber,
      productPrice,
      productCreatorId,
      productCreatorNickName,
      productCreatorAvatar,
      productCreatorIntroduce,
      brandPartyName,
      brandPartyIntroduce,
      supervisorName,
      supervisorIntroduce,
      isTransfer,
      activity,
    ];
  }
}

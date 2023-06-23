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
  final String? name;
  final String? image;
  final String? productId;
  final String? startTime;
  final String? endTime;
  final double? price;
  final int? number;
  final int? status;
  final bool? shelfStatus;
  final int? isDisplay;
  final int? doorsill;
  final dynamic doorsillRule;
  final int? isRemain;
  final dynamic reStartTime;
  final dynamic reEndTime;
  final dynamic reDoorsill;
  final dynamic reDoorsillRule;
  final int? reStatus;
  final int? purchaseNumberMax;
  final int? singlePurchaseNumberMax;
  final bool? shelfFlag;
  final bool? destroyStatus;
  final String? nftProductName;
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
  final dynamic activityBuyNum;

  const Row({
    this.current,
    this.rows,
    this.id,
    this.createDate,
    this.updateDate,
    this.createBy,
    this.updateBy,
    this.delFlag,
    this.name,
    this.image,
    this.productId,
    this.startTime,
    this.endTime,
    this.price,
    this.number,
    this.status,
    this.shelfStatus,
    this.isDisplay,
    this.doorsill,
    this.doorsillRule,
    this.isRemain,
    this.reStartTime,
    this.reEndTime,
    this.reDoorsill,
    this.reDoorsillRule,
    this.reStatus,
    this.purchaseNumberMax,
    this.singlePurchaseNumberMax,
    this.shelfFlag,
    this.destroyStatus,
    this.nftProductName,
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
    this.activityBuyNum,
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
    String? name,
    String? image,
    String? productId,
    String? startTime,
    String? endTime,
    double? price,
    int? number,
    int? status,
    bool? shelfStatus,
    int? isDisplay,
    int? doorsill,
    dynamic doorsillRule,
    int? isRemain,
    dynamic reStartTime,
    dynamic reEndTime,
    dynamic reDoorsill,
    dynamic reDoorsillRule,
    int? reStatus,
    int? purchaseNumberMax,
    int? singlePurchaseNumberMax,
    bool? shelfFlag,
    bool? destroyStatus,
    String? nftProductName,
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
    dynamic activityBuyNum,
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
      name: name ?? this.name,
      image: image ?? this.image,
      productId: productId ?? this.productId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      price: price ?? this.price,
      number: number ?? this.number,
      status: status ?? this.status,
      shelfStatus: shelfStatus ?? this.shelfStatus,
      isDisplay: isDisplay ?? this.isDisplay,
      doorsill: doorsill ?? this.doorsill,
      doorsillRule: doorsillRule ?? this.doorsillRule,
      isRemain: isRemain ?? this.isRemain,
      reStartTime: reStartTime ?? this.reStartTime,
      reEndTime: reEndTime ?? this.reEndTime,
      reDoorsill: reDoorsill ?? this.reDoorsill,
      reDoorsillRule: reDoorsillRule ?? this.reDoorsillRule,
      reStatus: reStatus ?? this.reStatus,
      purchaseNumberMax: purchaseNumberMax ?? this.purchaseNumberMax,
      singlePurchaseNumberMax:
          singlePurchaseNumberMax ?? this.singlePurchaseNumberMax,
      shelfFlag: shelfFlag ?? this.shelfFlag,
      destroyStatus: destroyStatus ?? this.destroyStatus,
      nftProductName: nftProductName ?? this.nftProductName,
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
      activityBuyNum: activityBuyNum ?? this.activityBuyNum,
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
      name,
      image,
      productId,
      startTime,
      endTime,
      price,
      number,
      status,
      shelfStatus,
      isDisplay,
      doorsill,
      doorsillRule,
      isRemain,
      reStartTime,
      reEndTime,
      reDoorsill,
      reDoorsillRule,
      reStatus,
      purchaseNumberMax,
      singlePurchaseNumberMax,
      shelfFlag,
      destroyStatus,
      nftProductName,
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
      activityBuyNum,
    ];
  }
}

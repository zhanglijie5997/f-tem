import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? current;
  final int? rows;
  final String? id;
  final String? createDate;
  final String? updateDate;
  final dynamic createBy;
  final String? updateBy;
  final bool? delFlag;
  final String? appCid;
  final dynamic openId;
  final dynamic unionId;
  final dynamic appOpenId;
  final String? nickName;
  final String? avatar;
  final String? wxName;
  final String? phone;
  final int? userType;
  final int? state;
  final int? ibNum;
  final int? freePaintCount;
  final int? ticketsNum;
  final int? achievementValue;
  final dynamic inviterId;
  final int? officialFocusStatus;
  final int? joinCommunityStatus;
  final int? isFirstPaint;
  final dynamic firstPaintDate;
  final String? loginDate;
  final String? personalProfile;
  final dynamic walletAddress;
  final String? nftWalletAddress;
  final int? isShowProduct;
  final int? isShowSellProduct;
  final String? postName;
  final String? postPhone;
  final String? postAddress;
  final dynamic flowSource;
  final String? realName;
  final String? cardNo;
  final dynamic authPassDate;
  final String? salePwd;
  final dynamic payPwd;
  final int? saleStatus;
  final int? buyStatus;
  final int? withdrawalStatus;
  final String? inviteCode;
  final dynamic sn;
  final int? isDestroy;
  final dynamic paintCount;
  final dynamic achievementNickName;
  final dynamic addTicketNum;
  final dynamic addIbNum;
  final dynamic reduceTicketNum;
  final dynamic reduceIbNum;
  final dynamic addAchievementValue;
  final int? integralRecordNum;
  final dynamic addICoinNum;
  final dynamic reduceICoinNum;
  final dynamic addFreePaintCount;
  final dynamic reduceFreePaintCount;

  const Data({
    this.current,
    this.rows,
    this.id,
    this.createDate,
    this.updateDate,
    this.createBy,
    this.updateBy,
    this.delFlag,
    this.appCid,
    this.openId,
    this.unionId,
    this.appOpenId,
    this.nickName,
    this.avatar,
    this.wxName,
    this.phone,
    this.userType,
    this.state,
    this.ibNum,
    this.freePaintCount,
    this.ticketsNum,
    this.achievementValue,
    this.inviterId,
    this.officialFocusStatus,
    this.joinCommunityStatus,
    this.isFirstPaint,
    this.firstPaintDate,
    this.loginDate,
    this.personalProfile,
    this.walletAddress,
    this.nftWalletAddress,
    this.isShowProduct,
    this.isShowSellProduct,
    this.postName,
    this.postPhone,
    this.postAddress,
    this.flowSource,
    this.realName,
    this.cardNo,
    this.authPassDate,
    this.salePwd,
    this.payPwd,
    this.saleStatus,
    this.buyStatus,
    this.withdrawalStatus,
    this.inviteCode,
    this.sn,
    this.isDestroy,
    this.paintCount,
    this.achievementNickName,
    this.addTicketNum,
    this.addIbNum,
    this.reduceTicketNum,
    this.reduceIbNum,
    this.addAchievementValue,
    this.integralRecordNum,
    this.addICoinNum,
    this.reduceICoinNum,
    this.addFreePaintCount,
    this.reduceFreePaintCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? current,
    int? rows,
    String? id,
    String? createDate,
    String? updateDate,
    dynamic createBy,
    String? updateBy,
    bool? delFlag,
    String? appCid,
    dynamic openId,
    dynamic unionId,
    dynamic appOpenId,
    String? nickName,
    String? avatar,
    String? wxName,
    String? phone,
    int? userType,
    int? state,
    int? ibNum,
    int? freePaintCount,
    int? ticketsNum,
    int? achievementValue,
    dynamic inviterId,
    int? officialFocusStatus,
    int? joinCommunityStatus,
    int? isFirstPaint,
    dynamic firstPaintDate,
    String? loginDate,
    String? personalProfile,
    dynamic walletAddress,
    String? nftWalletAddress,
    int? isShowProduct,
    int? isShowSellProduct,
    String? postName,
    String? postPhone,
    String? postAddress,
    dynamic flowSource,
    String? realName,
    String? cardNo,
    dynamic authPassDate,
    String? salePwd,
    dynamic payPwd,
    int? saleStatus,
    int? buyStatus,
    int? withdrawalStatus,
    String? inviteCode,
    dynamic sn,
    int? isDestroy,
    dynamic paintCount,
    dynamic achievementNickName,
    dynamic addTicketNum,
    dynamic addIbNum,
    dynamic reduceTicketNum,
    dynamic reduceIbNum,
    dynamic addAchievementValue,
    int? integralRecordNum,
    dynamic addICoinNum,
    dynamic reduceICoinNum,
    dynamic addFreePaintCount,
    dynamic reduceFreePaintCount,
  }) {
    return Data(
      current: current ?? this.current,
      rows: rows ?? this.rows,
      id: id ?? this.id,
      createDate: createDate ?? this.createDate,
      updateDate: updateDate ?? this.updateDate,
      createBy: createBy ?? this.createBy,
      updateBy: updateBy ?? this.updateBy,
      delFlag: delFlag ?? this.delFlag,
      appCid: appCid ?? this.appCid,
      openId: openId ?? this.openId,
      unionId: unionId ?? this.unionId,
      appOpenId: appOpenId ?? this.appOpenId,
      nickName: nickName ?? this.nickName,
      avatar: avatar ?? this.avatar,
      wxName: wxName ?? this.wxName,
      phone: phone ?? this.phone,
      userType: userType ?? this.userType,
      state: state ?? this.state,
      ibNum: ibNum ?? this.ibNum,
      freePaintCount: freePaintCount ?? this.freePaintCount,
      ticketsNum: ticketsNum ?? this.ticketsNum,
      achievementValue: achievementValue ?? this.achievementValue,
      inviterId: inviterId ?? this.inviterId,
      officialFocusStatus: officialFocusStatus ?? this.officialFocusStatus,
      joinCommunityStatus: joinCommunityStatus ?? this.joinCommunityStatus,
      isFirstPaint: isFirstPaint ?? this.isFirstPaint,
      firstPaintDate: firstPaintDate ?? this.firstPaintDate,
      loginDate: loginDate ?? this.loginDate,
      personalProfile: personalProfile ?? this.personalProfile,
      walletAddress: walletAddress ?? this.walletAddress,
      nftWalletAddress: nftWalletAddress ?? this.nftWalletAddress,
      isShowProduct: isShowProduct ?? this.isShowProduct,
      isShowSellProduct: isShowSellProduct ?? this.isShowSellProduct,
      postName: postName ?? this.postName,
      postPhone: postPhone ?? this.postPhone,
      postAddress: postAddress ?? this.postAddress,
      flowSource: flowSource ?? this.flowSource,
      realName: realName ?? this.realName,
      cardNo: cardNo ?? this.cardNo,
      authPassDate: authPassDate ?? this.authPassDate,
      salePwd: salePwd ?? this.salePwd,
      payPwd: payPwd ?? this.payPwd,
      saleStatus: saleStatus ?? this.saleStatus,
      buyStatus: buyStatus ?? this.buyStatus,
      withdrawalStatus: withdrawalStatus ?? this.withdrawalStatus,
      inviteCode: inviteCode ?? this.inviteCode,
      sn: sn ?? this.sn,
      isDestroy: isDestroy ?? this.isDestroy,
      paintCount: paintCount ?? this.paintCount,
      achievementNickName: achievementNickName ?? this.achievementNickName,
      addTicketNum: addTicketNum ?? this.addTicketNum,
      addIbNum: addIbNum ?? this.addIbNum,
      reduceTicketNum: reduceTicketNum ?? this.reduceTicketNum,
      reduceIbNum: reduceIbNum ?? this.reduceIbNum,
      addAchievementValue: addAchievementValue ?? this.addAchievementValue,
      integralRecordNum: integralRecordNum ?? this.integralRecordNum,
      addICoinNum: addICoinNum ?? this.addICoinNum,
      reduceICoinNum: reduceICoinNum ?? this.reduceICoinNum,
      addFreePaintCount: addFreePaintCount ?? this.addFreePaintCount,
      reduceFreePaintCount: reduceFreePaintCount ?? this.reduceFreePaintCount,
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
      appCid,
      openId,
      unionId,
      appOpenId,
      nickName,
      avatar,
      wxName,
      phone,
      userType,
      state,
      ibNum,
      freePaintCount,
      ticketsNum,
      achievementValue,
      inviterId,
      officialFocusStatus,
      joinCommunityStatus,
      isFirstPaint,
      firstPaintDate,
      loginDate,
      personalProfile,
      walletAddress,
      nftWalletAddress,
      isShowProduct,
      isShowSellProduct,
      postName,
      postPhone,
      postAddress,
      flowSource,
      realName,
      cardNo,
      authPassDate,
      salePwd,
      payPwd,
      saleStatus,
      buyStatus,
      withdrawalStatus,
      inviteCode,
      sn,
      isDestroy,
      paintCount,
      achievementNickName,
      addTicketNum,
      addIbNum,
      reduceTicketNum,
      reduceIbNum,
      addAchievementValue,
      integralRecordNum,
      addICoinNum,
      reduceICoinNum,
      addFreePaintCount,
      reduceFreePaintCount,
    ];
  }
}

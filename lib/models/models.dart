import 'package:art_app/models/accountment_list/accountment_list.dart';
import 'package:art_app/models/annocument_detail/annocument_detail.dart';
import 'package:art_app/models/app_login_phone/app_login_phone.dart';
import 'package:art_app/models/banner_list/banner_list.dart';
import 'package:art_app/models/home_position_list/home_position_list.dart';
import 'package:art_app/models/nft_home_calendar/nft_home_calendar.dart';
import 'package:art_app/models/nft_home_page_recommend_list/nft_home_page_recommend_list.dart';
import 'package:art_app/models/nft_market_get_plat_list/nft_market_get_plat_list.dart';
import 'package:art_app/models/product_get_product_list/product_get_product_list.dart';
import 'package:art_app/models/response/response.dart';
import 'package:art_app/models/sms_send_code_model/sms_send_code_model.dart';
import 'package:art_app/models/wx_user/wx_user.dart';
import 'package:equatable/equatable.dart';

import 'nft_market_get_consignment_product_list/nft_market_get_consignment_product_list.dart';

typedef DataFactory<T extends Equatable> = T Function(Json json);

final Map<Type, DataFactory> dataModelFactories = <Type, DataFactory>{
  AccountmentList: AccountmentList.fromJson,
  HomePositionList: HomePositionList.fromJson,
  BannerList: BannerList.fromJson,
  NftHomeCalendar: NftHomeCalendar.fromJson,
  AnnocumentDetail: AnnocumentDetail.fromJson,
  ProductGetProductList: ProductGetProductList.fromJson,
  SmsSendCodeModel: SmsSendCodeModel.fromJson,
  AppLoginPhone: AppLoginPhone.fromJson,
  WxUser: WxUser.fromJson,
  NftHomePageRecommendList: NftHomePageRecommendList.fromJson,
  NftMarketGetPlatList: NftMarketGetPlatList.fromJson,
  NftMarketGetConsignmentProductList:
      NftMarketGetConsignmentProductList.fromJson
};

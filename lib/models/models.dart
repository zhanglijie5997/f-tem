import 'package:art_app/models/accountment_list/accountment_list.dart';
import 'package:art_app/models/annocument_detail/annocument_detail.dart';
import 'package:art_app/models/banner_list/banner_list.dart';
import 'package:art_app/models/home_position_list/home_position_list.dart';
import 'package:art_app/models/nft_home_calendar/nft_home_calendar.dart';
import 'package:art_app/models/product_get_product_list/product_get_product_list.dart';
import 'package:art_app/models/response/response.dart';
import 'package:equatable/equatable.dart';

typedef DataFactory<T extends Equatable> = T Function(Json json);

final Map<Type, DataFactory> dataModelFactories = <Type, DataFactory>{
  AccountmentList: AccountmentList.fromJson,
  HomePositionList: HomePositionList.fromJson,
  BannerList: BannerList.fromJson,
  NftHomeCalendar: NftHomeCalendar.fromJson,
  AnnocumentDetail: AnnocumentDetail.fromJson,
  ProductGetProductList: ProductGetProductList.fromJson
};

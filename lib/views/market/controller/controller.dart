import 'package:art_app/models/nft_market_get_plat_list/nft_market_get_plat_list.dart';
import 'package:art_app/views/market/servcices/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketController extends GetxController with GetTickerProviderStateMixin {
  static MarketController get to => Get.find<MarketController>();
  final ScrollController scrollController = ScrollController();
  TabController? tabController;

  /// 顶部板块
  final _data = const NftMarketGetPlatList().obs;
  NftMarketGetPlatList get data => _data.value;

  /// 选择的tab
  final _active = 0.obs;
  int get active => _active.value;
  updateActive(int v) {
    _active.value = v;
  }

  init() async {
    final _ = await MarketServices.nftMarketgetPlatList();
    _data.value = _.data ?? const NftMarketGetPlatList();
    tabController =
        TabController(length: _.data?.data?.length ?? 0, vsync: this);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

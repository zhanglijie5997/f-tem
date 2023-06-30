import 'package:art_app/components/custom_refresh/custom_refresh.dart';
import 'package:art_app/models/nft_market_get_plat_list/datum.dart';
import 'package:art_app/models/nft_market_get_plat_list/nft_market_get_plat_list.dart';
import 'package:art_app/views/market/servcices/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/item.dart';

class MarketController extends GetxController with GetTickerProviderStateMixin {
  static MarketController get to => Get.find<MarketController>();
  final ScrollController scrollController = ScrollController();
  TabController? tabController;

  /// 刷新key
  List<GlobalKey<MarketBoxComponentState>> key = [];

  /// 顶部板块
  final _data = const NftMarketGetPlatList().obs;
  NftMarketGetPlatList get data => _data.value;

  /// 选择的tab
  final actives = 0.obs;
  int get active => actives.value;
  updateActive(int v) {
    actives.value = v;
  }

  /// 2级tab 选择
  final _secondTab = 0.obs;
  int get secondTab => _secondTab.value;
  updateSecondTab(int v) {
    _secondTab.value = v;
  }

  final _tabList = [
    const Datum(name: '全部', plateId: '', labelStr: ''),
  ].cast<Datum>().obs;
  // ignore: invalid_use_of_protected_member
  List<Datum> get tabList => _tabList.value;
  updateTabList(List<Datum> v) {
    _tabList.addAll(v);
    key = _tabList.map((e) => GlobalKey<MarketBoxComponentState>()).toList();
    tabController = TabController(length: _tabList.length, vsync: this)
      ..addListener(() {
        updateActive(tabController?.index ?? 0);
      });
  }

  init() async {
    final _ = await MarketServices.nftMarketgetPlatList();
    _data.value = _.data ?? const NftMarketGetPlatList();
    updateTabList(_.data?.data ?? []);
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

// ignore_for_file: invalid_use_of_protected_member

import 'package:art_app/constants/assets.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:art_app/models/accountment_list/accountment_list.dart';
import 'package:art_app/models/banner_list/banner_list.dart';
import 'package:art_app/models/home_position_list/home_position_list.dart';
import 'package:art_app/models/nft_home_calendar/row.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/home/services/services.dart';
import 'package:flutter/material.dart' hide Row;
import 'package:get/get.dart';

class TabsModel {
  String? name;
  String? type;
  int? index;
  TabsModel({this.name, this.type, this.index});

  TabsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['index'] = index;
    data['type'] = type;
    return data;
  }
}

class HomeController extends GetxController with GetTickerProviderStateMixin {
  static HomeController get to => Get.find<HomeController>();
  final ScrollController scrollController = ScrollController();
  final logo = {
    1: Assets.assetsImagesNewUser,
    2: Assets.assetsImagesMoney,
    3: Assets.assetsImagesSynthesis,
    4: Assets.assetsImagesCustomServices,
    5: Assets.assetsImagesShare
  };

  /// 公告
  final _announcementList = const AccountmentList().obs;
  AccountmentList get announcementList => _announcementList.value;

  /// 金刚区
  final _posList = const HomePositionList().obs;
  HomePositionList get posList => _posList.value;

  /// banner
  final _banner = const BannerList().obs;
  BannerList get banner => _banner.value;

  late final tabbarController = TabController(length: tabs.length, vsync: this);

  /// tabs
  final _tabs = [
    TabsModel(name: LocaleKeys.selectedCollection, type: '1', index: 0),
    TabsModel(name: LocaleKeys.firstCollection, type: '2', index: 1),
  ].obs;
  List<TabsModel> get tabs => _tabs.value;

  /// 首发日历
  final _firstCalendar = [].cast<Row>().obs;
  List<Row> get firstCalendar => _firstCalendar.value;

  bool calenderFinish = false;
  int _calenderPage = 1;

  /// 保存滚动状态
  final pageStorageKey = const PageStorageKey(1);
  final firstPageKey = const PageStorageKey(2);
  final calenderPageKey = const PageStorageKey(3);

  // tabbar 选择
  final _selectIndex = 0.obs;
  int get selectIndex => _selectIndex.value;

  void listener() {
    _selectIndex.value = tabbarController.index;
  }

  Future<void> init() async {
    tabbarController.addListener(listener);
    final _ = await HomeServices.announcementList();
    LogUtil.w('获取home 数据 $_');
    if (_.code == 200) {
      _announcementList.value = _.data!;
    }

    var data = await HomeServices.homePositionSelectNftHomePositionList();
    final list = data.data?.data
        ?.map((e) => e.copyWith(logoImg: logo[e.sortChart]))
        .toList();
    LogUtil.w(data);
    _posList.value = data.data!.copyWith(data: list);

    var bannerData = await HomeServices.rotationChartSelectRotationChartList();
    _banner.value = bannerData.data!;
  }

  /// 首发藏品加载
  calenderOnLoad([int? page]) async {
    final _ = await HomeServices.nftHomePageCalendar(page ?? _calenderPage);
    _firstCalendar.value = _.data?.rows ?? [];
    if ((_.data?.rows?.length ?? 0) < 20) {
      calenderFinish = true;
      return;
    }
    _calenderPage++;
  }

  @override
  void onInit() {
    init();
    calenderOnLoad();
    super.onInit();
  }
}

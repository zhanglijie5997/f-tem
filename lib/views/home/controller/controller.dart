import 'package:art_app/constants/assets.dart';
import 'package:art_app/models/accountment_list/accountment_list.dart';
import 'package:art_app/models/home_position_list/home_position_list.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/home/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  init() async {
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
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}

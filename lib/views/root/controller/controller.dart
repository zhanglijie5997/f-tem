import 'package:art_app/constants/assets.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:art_app/router/router.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/home/home.dart';
import 'package:art_app/views/market/market.dart';
import 'package:art_app/views/me/me.dart';
import 'package:art_app/views/message/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../../../hook/notify_hook/notify_hook.dart';

class BottomItemModel {
  late String img;
  late String name;
  late Widget child;
  late int index;
  late String selectImg;
  late int? badge;

  BottomItemModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    child = json['child'];
    index = json['index'];
    selectImg = json['selectImg'];
    badge = json['badge'];
  }

  BottomItemModel(
      {required this.img,
      required this.name,
      required this.child,
      required this.index,
      required this.selectImg,
      this.badge});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['img'] = img;
    data['child'] = child;
    data['index'] = index;
    data['selectImg'] = selectImg;
    data['badge'] = badge;
    return data;
  }
}

class DrawModel {
  int? type;
  String? page;
  int? count;
  String? name;
  String? icon;

  DrawModel({this.type, this.page, this.count, this.name, this.icon});

  DrawModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    page = json['page'];
    count = json['count'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['page'] = page;
    data['count'] = count;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}

class RootController extends GetxController {
  static RootController get to => Get.find<RootController>();
  final list = [
    BottomItemModel(
        img: Assets.assetsImagesHome,
        selectImg: Assets.assetsImagesHomeSelect,
        name: LocaleKeys.home,
        child: const HomeView(),
        index: 0),
    BottomItemModel(
        img: Assets.assetsImagesMarket,
        selectImg: Assets.assetsImagesMarketSelect,
        name: LocaleKeys.market,
        child: const MarketView(),
        index: 1),
    BottomItemModel(
        img: Assets.assetsImagesMessage,
        selectImg: Assets.assetsImagesMessageSelect,
        name: LocaleKeys.message,
        child: const MessageView(),
        index: 2,
        badge: 3),
    BottomItemModel(
        img: Assets.assetsImagesMe,
        selectImg: Assets.assetsImagesMeSelect,
        name: LocaleKeys.me,
        child: const MeView(),
        index: 3),
  ].obs;

  final _active = 0.obs;

  int get active => _active.value;

  updateActive(int v) {
    _active.value = v;
    pageController.jumpToPage(v);
  }

  final PageController pageController = PageController();

  screenShotListener() {
    LogUtil.w('用户使用系统截屏');
  }

  /// draw key
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  openDraw() {
    key.currentState?.openDrawer();
  }

  /// 订单列表
  final _orderList = [
    DrawModel(
        type: 0,
        name: '常规订单',
        icon: Assets.assetsImagesIconIconOrder,
        page: RoutesName.regularOrder,
        count: 0),
    DrawModel(
        type: 1,
        name: '求购订单',
        icon: Assets.assetsImagesIconIconAskBuy,
        page: RoutesName.purchaseOrder,
        count: 0),
    DrawModel(
        type: 2,
        name: '转售订单',
        icon: Assets.assetsImagesIconIconExchange,
        page: RoutesName.resaleOrder,
        count: 0),
    DrawModel(
        type: 3,
        name: '我的卡券',
        icon: Assets.assetsImagesIconIconCoupon,
        page: RoutesName.coupon,
        count: 0),
    DrawModel(
        type: 4,
        name: '分享衍界',
        icon: Assets.assetsImagesIconIconShare,
        page: RoutesName.share,
        count: 0),
    DrawModel(
        type: 5,
        name: '帮助中心',
        icon: Assets.assetsImagesIconIconHelp,
        page: RoutesName.help,
        count: 0),
    DrawModel(
        type: 6,
        name: '关于衍界',
        icon: Assets.assetsImagesIconIconAbout,
        page: RoutesName.about,
        count: 0),
  ].obs;

  // ignore: invalid_use_of_protected_member
  List<DrawModel> get orderList => _orderList.value;

  cleanBadge() {
    LogUtil.w('清除badge');
    list[2].badge = 0;
    list.value = list
        .map((e) => BottomItemModel(
            img: e.img,
            name: e.name,
            child: e.child,
            index: e.index,
            selectImg: e.selectImg,
            badge: 0))
        .toList();
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

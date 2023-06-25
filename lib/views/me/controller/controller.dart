import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/home/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeController extends GetxController with GetTickerProviderStateMixin {
  static MeController get to => Get.find<MeController>();

  /// 刷新加载状态
  final loadings = true.obs;
  bool get loading => loadings.value;

  late final tabs = [
    TabsModel(name: '全部', type: '0', index: 0),
    TabsModel(name: '寄售', type: '0', index: 0),
    TabsModel(name: '转售', type: '0', index: 0),
    TabsModel(name: '合成', type: '0', index: 0)
  ];

  late final TabController tabController =
      TabController(length: tabs.length, vsync: this);

  final _opacity = (1.0).obs;
  double get opacity => _opacity.value;

  late final ScrollController scrollController = ScrollController()
    ..addListener(listener);

  void listener() {
    _opacity.value = (scrollController.position.maxScrollExtent -
            scrollController.position.pixels) /
        scrollController.position.maxScrollExtent;
    LogUtil.w(
        '${scrollController.position.maxScrollExtent} opacity: ${_opacity.value}');
  }

  updateLoading(bool v) {
    loadings.value = v;
  }

  /// 全部加载

  @override
  void onInit() {
    super.onInit();
  }
}

import 'package:art_app/db/db.dart';
import 'package:art_app/db/home/entity/home.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get to => Get.find<HomeController>();
  final ScrollController scrollController = ScrollController();

  init() async{
    final _ = await HomeDBUtils.getList();
    LogUtil.w('获取home 数据 $_');
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}

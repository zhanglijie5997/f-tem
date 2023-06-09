import 'package:art_app/constants/assets.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:art_app/views/home/home.dart';
import 'package:art_app/views/me/me.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomItemModel {
  late String img;
  late String name;
  late Widget child;
  late int index;
  late String selectImg;
  BottomItemModel.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    name = json['name'];
    child = json['child'];
    index = json['index'];
    selectImg = json['selectImg'];
  }
  BottomItemModel({required this.img, required this.name, required this.child, required this.index, required this.selectImg});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['img'] = img;
    data['child'] = child;
    data['index'] = index;
    data['selectImg'] = selectImg;
    return data;
  }
}

class RootController extends GetxController {
  static RootController get to => Get.find<RootController>();
  final  list = [
    BottomItemModel(img: Assets.assetsImagesHome, selectImg: Assets.assetsImagesHomeSelect, name: LocaleKeys.hello, child: const HomeView(), index: 0),
    BottomItemModel(img: Assets.assetsImagesMarket, selectImg: Assets.assetsImagesMarketSelect, name: LocaleKeys.hello, child: const HomeView(), index: 1),
    BottomItemModel(img: Assets.assetsImagesMessage, selectImg: Assets.assetsImagesMessageSelect, name: LocaleKeys.hello, child: const HomeView(), index: 2),
    BottomItemModel(img: Assets.assetsImagesMe, selectImg: Assets.assetsImagesMeSelect, name: LocaleKeys.me, child: const MeView(), index: 3),
  ].obs;

  final _active = 0.obs;
  int get active => _active.value;

  updateActive(int v) {
    _active.value = v;
    pageController.jumpToPage(v);
  }

  final PageController pageController = PageController();
}

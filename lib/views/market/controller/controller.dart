import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarketController extends GetxController {
  static MarketController get to => Get.find<MarketController>();
  final ScrollController scrollController = ScrollController();
}

import 'package:get/get.dart';

import '../controller/controller.dart';

class MarketBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<MarketController>(() => MarketController());
  }
}
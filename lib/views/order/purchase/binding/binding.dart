import 'package:get/get.dart';

import '../controller/controller.dart';

class PurchaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PurchaseController>(() => PurchaseController());
  }
}

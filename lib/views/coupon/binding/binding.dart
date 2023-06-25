import 'package:get/get.dart';

import '../controller/controller.dart';

class CouponBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponController>(() => CouponController());
  }
}

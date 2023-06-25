import 'package:get/get.dart';

import '../controller/controller.dart';

class ResaleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResaleController>(() => ResaleController());
  }
}

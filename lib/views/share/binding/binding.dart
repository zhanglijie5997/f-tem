import 'package:get/get.dart';

import '../controller/controller.dart';

class ShareBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShareController>(() => ShareController());
  }
}

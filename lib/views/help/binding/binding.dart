import 'package:get/get.dart';

import '../controller/controller.dart';

class HelpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpController>(() => HelpController());
  }
}

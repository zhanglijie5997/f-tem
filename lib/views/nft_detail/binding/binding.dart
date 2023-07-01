import 'package:get/get.dart';

import '../controller/controller.dart';

class NftDetailBinding implements Bindings {
  @override
  void dependencies() {
    final id = Get.parameters['id'];
    Get.lazyPut<NftDetailController>(() => NftDetailController(), tag: id);
  }
}

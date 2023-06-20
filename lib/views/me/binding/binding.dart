import 'package:art_app/views/me/controller/controller.dart';
import 'package:get/get.dart';

class MeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeController>(() => MeController());
  }
}

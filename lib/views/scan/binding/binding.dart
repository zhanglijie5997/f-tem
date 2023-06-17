import 'package:art_app/views/scan/controller/controller.dart';
import 'package:get/get.dart';

class ScanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }
}

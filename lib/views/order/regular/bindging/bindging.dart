import 'package:art_app/views/order/regular/controller/controller.dart';
import 'package:get/get.dart';

class RoutineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegularController>(() => RegularController());
  }
}

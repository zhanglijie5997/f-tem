import 'package:art_app/views/webview/controller/controller.dart';
import 'package:get/get.dart';

class WebviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebviewController>(() => WebviewController());
  }
}

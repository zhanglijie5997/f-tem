import 'package:art_app/views/announcement_detail/controller/controller.dart';
import 'package:get/get.dart';

class AnnoouncementDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementDetailController>(
        () => AnnouncementDetailController());
  }
}

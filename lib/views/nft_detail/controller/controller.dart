import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/utils/utils.dart';
import 'package:get/get.dart';

class NftDetailController extends GetxController {
  final par = Get.parameters;

  // static NftDetailController get to =>
  //     Get.find<NftDetailController>(tag: Get.parameters['id']);

  init() async {
    final _ = await Utils.getImageSize(par['image'] ?? '');
    LogUtil.w(_);
    final _ra = Get.width / (_.width / _.height);
  }

  @override
  void onInit() {
    LogUtil.w(par);
    init();
    super.onInit();
  }
}

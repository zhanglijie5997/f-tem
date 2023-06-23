import 'package:art_app/models/annocument_detail/annocument_detail.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/announcement_detail/services/services.dart';
import 'package:get/get.dart';

class AnnouncementDetailController extends GetxController
    with GetTickerProviderStateMixin {
  static AnnouncementDetailController get to =>
      Get.find<AnnouncementDetailController>();
  final params = Get.parameters;

  /// 公告详情
  final _data = const AnnocumentDetail().obs;
  AnnocumentDetail get data => _data.value;

  init() async {
    final _ =
        await AnnouncementDetailServices.announcementDetail(params['id'] ?? '');
    LogUtil.w(_.data?.data?.content);
    _data.value = _.data!;
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}

import 'package:art_app/http/http.dart';
import 'package:art_app/models/annocument_detail/annocument_detail.dart';
import 'package:art_app/models/response/response.dart';

abstract class AnnouncementDetailUrl {
  static String get announcementDetail => '/api/announcement/detail';
}

class AnnouncementDetailServices {
  /// 公告详情
  static Future<ResponseModel<AnnocumentDetail>> announcementDetail(
          String id) =>
      HttpUtil.fetchModel<AnnocumentDetail>(FetchType.get,
          url: AnnouncementDetailUrl.announcementDetail,
          queryParameters: {'id': id});
}

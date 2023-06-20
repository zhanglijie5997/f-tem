import 'package:art_app/http/http.dart';
import 'package:art_app/models/accountment_list/accountment_list.dart';
import 'package:art_app/models/home_position_list/home_position_list.dart';
import 'package:art_app/models/response/response.dart';

abstract class ServicesUrl {
  static String get announcementList => '/api/announcement/list';
  static String get homePositionSelectNftHomePositionList =>
      '/api/homePosition/selectNftHomePositionList';
  static String get rotationChartSelectRotationChartList =>
      '/api/rotationChart/selectRotationChartList';
}

class HomeServices {
  /// 公告
  static Future<ResponseModel<AccountmentList>> announcementList() =>
      HttpUtil.fetchModel<AccountmentList>(FetchType.get,
          url: ServicesUrl.announcementList,
          queryParameters: {'row': 10, 'current': 1});

  /// 金刚区
  static Future<ResponseModel<HomePositionList>>
      homePositionSelectNftHomePositionList() =>
          HttpUtil.fetchModel<HomePositionList>(
            FetchType.get,
            url: ServicesUrl.homePositionSelectNftHomePositionList,
          );
  /// 获取banna
  static Future<ResponseModel<HomePositionList>>
      rotationChartSelectRotationChartList() =>
          HttpUtil.fetchModel<HomePositionList>(
            FetchType.get,
            url: ServicesUrl.rotationChartSelectRotationChartList,
          );
  
}

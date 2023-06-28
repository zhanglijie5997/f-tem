import 'package:art_app/http/http.dart';
import 'package:art_app/models/accountment_list/accountment_list.dart';
import 'package:art_app/models/banner_list/banner_list.dart';
import 'package:art_app/models/home_position_list/home_position_list.dart';
import 'package:art_app/models/nft_home_calendar/nft_home_calendar.dart';
import 'package:art_app/models/nft_home_page_recommend_list/nft_home_page_recommend_list.dart';
import 'package:art_app/models/response/response.dart';

abstract class ServicesUrl {
  static String get announcementList => '/api/announcement/list';
  static String get homePositionSelectNftHomePositionList =>
      '/api/homePosition/selectNftHomePositionList';
  static String get rotationChartSelectRotationChartList =>
      '/api/rotationChart/selectRotationChartList';
  static String get nftHomePageCalendar => '/api/nft/homePage/calendar';
  static String get nftHomePageRecommendList =>
      '/api/nft/homePage/recommendList';
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
  static Future<ResponseModel<BannerList>>
      rotationChartSelectRotationChartList() => HttpUtil.fetchModel<BannerList>(
            FetchType.get,
            url: ServicesUrl.rotationChartSelectRotationChartList,
          );

  /// 获取首发
  /// * [page] 分页
  static Future<ResponseModel<NftHomeCalendar>> nftHomePageCalendar(
          [int page = 1]) =>
      HttpUtil.fetchModel<NftHomeCalendar>(FetchType.get,
          url: ServicesUrl.nftHomePageCalendar,
          queryParameters: {'rows': 20, 'current': page});

  /// 获取精选藏品
  /// * [page] 分页
  static Future<ResponseModel<NftHomePageRecommendList>>
      nftHomePageRecommendList([int page = 1]) =>
          HttpUtil.fetchModel<NftHomePageRecommendList>(FetchType.get,
              url: ServicesUrl.nftHomePageRecommendList,
              queryParameters: {'rows': 20, 'current': page});
}

import 'package:art_app/http/http.dart';
import 'package:art_app/models/product_get_product_list/product_get_product_list.dart';
import 'package:art_app/models/response/response.dart';
import 'package:art_app/models/wx_user/wx_user.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/utils/storage/storage.dart';

abstract class MeServicesUrl {
  static get productGetProductList => '/nft/user/product/getProductList';
  static get wxUser => '/wx/user/';
}

abstract class ProductGetProductListType {
  static String get all => '';
  static String get sale => '1';
  static String get resale => '2';
  static String get synthesis => '3';
}

class MeServices {
  /// 获取自己的藏品信息
  static Future<ResponseModel<ProductGetProductList>> productGetProductList(
      [String? type, int? current = 1, int? rows = 10]) {
    LogUtil.w(StorageUtils.userMsg.data);
    return HttpUtil.fetchModel<ProductGetProductList>(FetchType.get,
        url: MeServicesUrl.productGetProductList,
        queryParameters: {
          'type': type ?? ProductGetProductListType.all,
          'userId': StorageUtils.userMsg.data?.id,
          'current': current,
          'rows': rows
        });
  }

  static Future<ResponseModel<WxUser>> wxUser(String id) {
    return HttpUtil.fetchModel<WxUser>(FetchType.get,
        url: '${MeServicesUrl.wxUser}$id');
  }
}

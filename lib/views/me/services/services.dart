import 'package:art_app/http/http.dart';
import 'package:art_app/models/product_get_product_list/product_get_product_list.dart';
import 'package:art_app/models/response/response.dart';

abstract class MeServicesUrl {
  static get productGetProductList => '/nft/user/product/getProductList';
}

abstract class ProductGetProductListType {
  static String get all => '';
  static String get sale => '1';
  static String get resale => '2';
  static String get synthesis => '3';
}

class MeServices {
  static Future<ResponseModel<ProductGetProductList>> productGetProductList(
      [String? type]) {
    return HttpUtil.fetchModel<ProductGetProductList>(FetchType.get,
        url: MeServicesUrl.productGetProductList,
        queryParameters: {'type': type ?? ProductGetProductListType.all});
  }
}

import 'package:art_app/http/http.dart';
import 'package:art_app/models/product_get_product_list/product_get_product_list.dart';
import 'package:art_app/models/response/response.dart';

abstract class MeServicesUrl {
  static get productGetProductList => '/nft/user/product/getProductList';
}

class MeServices {
  static Future<ResponseModel<ProductGetProductList>> productGetProductList() {
    return HttpUtil.fetchModel<ProductGetProductList>(FetchType.get,
        url: MeServicesUrl.productGetProductList);
  }
}

import 'package:art_app/http/http.dart';
import 'package:art_app/models/nft_market_get_plat_list/nft_market_get_plat_list.dart';
import 'package:art_app/models/response/response.dart';

class NftMarketGetConsignmentProductListParams {
  String? current;
  String? rows;
  String? latest;
  String? floorPrice;
  String? plateId;

  NftMarketGetConsignmentProductListParams(
      {this.current, this.rows, this.latest, this.floorPrice, this.plateId});

  NftMarketGetConsignmentProductListParams.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    rows = json['rows'];
    latest = json['latest'];
    floorPrice = json['floorPrice'];
    plateId = json['plateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current'] = current;
    data['rows'] = rows;
    data['latest'] = latest;
    data['floorPrice'] = floorPrice;
    data['plateId'] = plateId;
    return data;
  }
}

abstract class MarketServicesUrl {
  static get nftMarketgetPlatList => '/nft/market/getPlateList';
  static get nftMarketGetConsignmentProductList =>
      '/nft/market/getConsignmentProductList';
}

class MarketServices {
  /// 板块
  static Future<ResponseModel<NftMarketGetPlatList>> nftMarketgetPlatList() {
    return HttpUtil.fetchModel<NftMarketGetPlatList>(FetchType.get,
        url: MarketServicesUrl.nftMarketgetPlatList);
  }

  /// 板块内容
  static Future<ResponseModel> nftMarketGetConsignmentProductList(
      NftMarketGetConsignmentProductListParams v) {
    return HttpUtil.fetchModel(FetchType.get,
        url: MarketServicesUrl.nftMarketGetConsignmentProductList,
        queryParameters: v.toJson());
  }
}

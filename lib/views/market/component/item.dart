import 'package:art_app/components/custom_load_more/custom_load_more.dart';
import 'package:art_app/components/custom_refresh/custom_refresh.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/market/servcices/services.dart';
import 'package:flutter/material.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../models/nft_market_get_plat_list/datum.dart';

class MarketBoxComponent extends StatefulWidget {
  final Datum data;
  const MarketBoxComponent({Key? key, required this.data}) : super(key: key);

  @override
  State<MarketBoxComponent> createState() => _MarketBoxComponentState();
}

class _MarketBoxComponentState extends State<MarketBoxComponent> {
  final scrollController = ScrollController();
  late final source = MarketLoadMoreSource(data: widget.data);
  @override
  Widget build(BuildContext context) {
    return CustomRefresh(
      onRefresh: () async {},
      controller: scrollController,
      child: CustomLoadMore(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: .756,
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        souceList: source,
        child: (_, i) => Text(''),
      ),
    );
  }
}

class MarketLoadMoreSource extends LoadingMoreBase {
  final Datum data;
  MarketLoadMoreSource({required this.data});
  int pageIndex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  @override
  bool get hasMore => (_hasMore && length % 10 == 0) || forceRefresh;

  @override
  // ignore: avoid_renaming_method_parameters
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    pageIndex = 1;
    //force to refresh list when you don't want clear list before request
    //for the case, if your list already has 20 items.
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isLoadMoreAction = false]) async {
    try {
      final _ = await MarketServices.nftMarketGetConsignmentProductList(
          NftMarketGetConsignmentProductListParams(
              current: '$pageIndex',
              rows: '10',
              plateId: '${data.plateId}',
              floorPrice: ''));
      if (pageIndex == 1) {
        clear();
      }
      LogUtil.e(_);
      addAll(_.data?.rows ?? []);
      _hasMore = (_.data?.rows ?? []).length < 10;
      pageIndex++;
      return true;
    } catch (e) {
      return false;
    }
  }
}

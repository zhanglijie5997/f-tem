import 'package:art_app/components/custom_img/custom_img.dart';
import 'package:art_app/components/custom_load_more/custom_load_more.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/market/controller/controller.dart';
import 'package:art_app/views/market/servcices/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';

import '../../../models/nft_market_get_plat_list/datum.dart';
import 'package:art_app/models/nft_market_get_consignment_product_list/row.dart'
    as row;

class MarketBoxComponent extends StatefulWidget {
  final Datum data;
  final Function(Function)? refresh;
  const MarketBoxComponent({Key? key, required this.data, this.refresh})
      : super(key: key);

  @override
  State<MarketBoxComponent> createState() => MarketBoxComponentState();
}

class MarketBoxComponentState extends State<MarketBoxComponent>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<MarketController>();
  final scrollController = ScrollController();
  late final source = MarketLoadMoreSource(data: widget.data);

  // @override
  // void initState() {
  //   ever(controller.actives, (callback) {
  //     if (controller.tabList[callback].plateId == widget.data.plateId) {
  //       widget.refresh?.call(source.refresh);
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, top: 14),
      child: CustomLoadMore(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: .72,
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 8,
            crossAxisSpacing: 9),
        souceList: source,
        child: (_, i) => Container(
            decoration: BoxDecoration(
                color: context.customTheme?.bottomBar, borderRadius: 5.radius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: SizedBox(
                    // height: 157,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: CustomImage(
                            url: _.productCover ?? '',
                            fit: BoxFit.fill,
                            size: const Size(double.infinity, 157),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // 名称
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_.productName ?? '',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontSize: 13)),
                      Padding(
                        padding: const EdgeInsets.only(top: 9.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: context.customTheme?.tagText,
                                  borderRadius: 2.radius),
                              padding: const EdgeInsets.all(3),
                              child: Text('发行100',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                      fontSize: 12,
                                      color: context.customTheme?.tagBg)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: context.customTheme?.tagText,
                                  borderRadius: 2.radius),
                              margin: const EdgeInsets.only(left: 5),
                              padding: const EdgeInsets.all(3),
                              child: Text('流通100',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                      fontSize: 12,
                                      color: context.customTheme?.tagBg)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: '¥',
                              style: context.textTheme.labelLarge?.copyWith(
                                  fontSize: 11, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '111',
                              style: context.textTheme.labelLarge?.copyWith(
                                  fontSize: 17, fontWeight: FontWeight.bold))
                        ])),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MarketLoadMoreSource extends LoadingMoreBase<row.Row> {
  final Datum data;
  MarketLoadMoreSource({Key? key, required this.data});
  int pageIndex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  // List<Datum>
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
    LogUtil.w('request111');
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
              floorPrice: '',
              latest: ''));
      if (pageIndex == 1) {
        // clear();
        final Iterable<row.Row> e = [...(_.data?.rows ?? []), ...this];
        if (length == 0) {
          addAll(_.data?.rows ?? []);
        } else {
          // addAll(e);
          sublist(0, (_.data?.rows ?? []).length);
        }
      } else {
        addAll(_.data?.rows ?? []);
      }
      LogUtil.e(_);
      _hasMore = (_.data?.rows ?? []).length < 10;
      pageIndex++;
      return true;
    } catch (e) {
      return false;
    }
  }
}

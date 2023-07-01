import 'package:art_app/components/custom_img/custom_img.dart';
import 'package:art_app/components/custom_load_more/custom_load_more.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:art_app/router/router.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:art_app/models/nft_home_page_recommend_list/row.dart' as rows;

import '../services/services.dart';

class LoadMoreListSource extends LoadingMoreBase<rows.Row> {
  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;

  @override
  bool get hasMore => (_hasMore && length % 10 == 0) || forceRefresh;

  @override
  // ignore: avoid_renaming_method_parameters
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    pageindex = 1;
    //force to refresh list when you don't want clear list before request
    //for the case, if your list already has 20 items.
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    try {
      final _ = await HomeServices.nftHomePageRecommendList(pageindex);
      if (pageindex == 1) {
        clear();
      }
      LogUtil.e(_);
      addAll(_.data?.rows ?? []);
      _hasMore = (_.data?.rows ?? []).length < 10;
      pageindex++;
      return true;
    } catch (e) {
      return false;
    }
  }
}

class WinnowCollectionComponent extends StatefulWidget {
  final bool loading;
  const WinnowCollectionComponent({super.key, required this.loading});

  @override
  State<WinnowCollectionComponent> createState() =>
      _WinnowCollectionComponentState();
}

class _WinnowCollectionComponentState extends State<WinnowCollectionComponent>
    with AutomaticKeepAliveClientMixin {
  late final LoadMoreListSource source = LoadMoreListSource();

  @override
  void didUpdateWidget(WinnowCollectionComponent oldWidget) {
    if (widget.loading) {
      source.refresh();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomLoadMore<rows.Row>(
        child: (_, i) => ClipRRect(
              borderRadius: 5.radius,
              child: Container(
                padding: const EdgeInsets.only(bottom: 18),
                decoration: BoxDecoration(
                    color: context.customTheme?.bottomBar,
                    borderRadius: 5.radius),
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: Hero(
                        tag: _.id ?? '',
                        child: CustomImage(
                          url: _.productCover ?? '',
                          size: const Size(double.infinity, 350),
                        ),
                      ),
                    ),

                    /// 名称
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 10, left: 10, right: 10),
                      child: Text(
                        '${_.productName}',
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    /// 发行
                    ClipRRect(
                      borderRadius: 5.radius,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  color: context.customTheme?.tagBg,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 2),
                                  // height: 16,
                                  child: Text(LocaleKeys.release.tr,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .customTheme?.tagText)),
                                ),
                                Container(
                                  color: context.customTheme?.btnSuccess,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  // height: 16,
                                  child: Text(
                                      '${_.productMintNumber}${LocaleKeys.part.tr}',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: context.customTheme?.tagBg,
                                      )),
                                )
                              ],
                            ),

                            // 价格
                            RichText(
                                text: TextSpan(
                                    children: [
                                  TextSpan(
                                      text: '${_.productPrice}',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold))
                                ],
                                    text: '¥ ',
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)))
                          ],
                        ),
                      ),
                    ),

                    // 信息
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
                      child: Row(
                        children: [
                          CustomImage(
                            url: _.productCreatorAvatar ?? '',
                            size: const Size(18, 18),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              _.productCreatorNickName ?? '',
                              style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.customTheme?.desColor),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: context.customTheme?.btnSuccess,
                                borderRadius: 8.radius),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Text(
                              LocaleKeys.creator.tr,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.customTheme?.success,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ).onTap(() {
              Get.toNamed('${RoutesName.nftDetail}/${_.nftProductId}',
                  parameters: {
                    'id': _.id ?? '',
                    'image': _.productImage ?? ''
                  });
            }),
        souceList: source);
  }

  @override
  bool get wantKeepAlive => true;
}

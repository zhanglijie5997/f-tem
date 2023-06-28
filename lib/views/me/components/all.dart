import 'package:art_app/components/custom_img/custom_img.dart';
import 'package:art_app/components/custom_load_more/custom_load_more.dart';
import 'package:art_app/components/custom_login/custom_login.dart';
import 'package:art_app/constants/assets.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:art_app/models/product_get_product_list/product_get_product_list.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/me/controller/controller.dart';
import 'package:art_app/views/me/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:art_app/models/product_get_product_list/datum.dart';

class LoadMoreListSource extends LoadingMoreBase<Datum> {
  final String? type;
  LoadMoreListSource({this.type});
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
      final _ = await MeServices.productGetProductList(type);
      if (pageindex == 1) {
        clear();
      }
      LogUtil.e(_);
      addAll(_.data?.data ?? []);
      _hasMore = (_.data?.data ?? []).length < 10;
      pageindex++;
      return true;
    } catch (e) {
      return false;
    }
  }
}

class MeAllComponent extends StatefulWidget {
  final String? type;
  const MeAllComponent({super.key, this.type});

  @override
  State<MeAllComponent> createState() => _MeAllComponentState();
}

class _MeAllComponentState extends State<MeAllComponent>
    with AutomaticKeepAliveClientMixin {
  late final key = PageStorageKey(widget.type);
  ProductGetProductList? list = const ProductGetProductList();
  late final source = LoadMoreListSource(type: widget.type);

  @override
  void initState() {
    super.initState();
    ever(MeController.to.loadings, (v) {
      if (v) {
        source.refresh();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomLoginWidget(
        notLoginWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: Image.asset(Assets.assetsImagesNoEmptyV3),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 21.0),
              child: Text(
                LocaleKeys.loginLookInformation.tr,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.customTheme?.subtitle),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 54),
              width: 156,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: 24.radius,
                  gradient: LinearGradient(
                      colors: ['#FFF1E3'.color(), '#E9BF84'.color()])),
              child: Text(LocaleKeys.login.tr,
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 14, color: context.customTheme?.btnSuccess)),
            )
          ],
        ),
        loginWidget: CustomLoadMore<Datum?>(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: .756,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          souceList: source,
          child: (_, i) => Container(
            decoration: BoxDecoration(
                borderRadius: 5.radius, color: context.customTheme?.bottomBar),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      child: SizedBox(
                        height: 168,
                        width: double.infinity,
                        child: CustomImage(
                          url: _?.productCover ?? '',
                          size: const Size(168, 168),
                        ),
                      ),
                    ),

                    // 名称
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(_?.productName ?? '',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text('共${_?.sumNumber ?? 0}个',
                          style: context.textTheme.bodyMedium?.copyWith(
                              fontSize: 12,
                              color: context.customTheme?.subtitle)),
                    )
                  ],
                )
              ],
            ),
          ),
        )
//       GridView.builder(
//           key: key,
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           physics: const ClampingScrollPhysics(),
//           itemCount: list?.data?.length ?? 0,
//           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               childAspectRatio: .756,
//               maxCrossAxisExtent: 200,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10),
//           itemBuilder: (c, i) {
//             final _ = list?.data?[i];
//             return Container(
//               decoration: BoxDecoration(
//                   borderRadius: 5.radius,
//                   color: context.customTheme?.bottomBar),
//               child: Stack(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(4),
//                             topRight: Radius.circular(4)),
//                         child: SizedBox(
//                           height: 168,
//                           width: double.infinity,
//                           child: CustomImage(
//                             url: _?.productCover ?? '',
//                             size: const Size(168, 168),
//                           ),
//                         ),
//                       ),
//
//                       // 名称
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Text(_?.productName ?? '',
//                             style: context.textTheme.bodyMedium
//                                 ?.copyWith(fontSize: 14)),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Text('共${_?.sumNumber ?? 0}个',
//                             style: context.textTheme.bodyMedium?.copyWith(
//                                 fontSize: 12,
//                                 color: context.customTheme?.subtitle)),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             );
//           }),
        );
  }

  @override
  bool get wantKeepAlive => true;
}

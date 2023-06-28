import 'package:art_app/components/custom_refresh/custom_refresh.dart';
import 'package:art_app/constants/constants.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/router/router.dart';
import 'package:art_app/views/market/controller/controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
// import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import 'component/item.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView>
    with AutomaticKeepAliveClientMixin {
  final controller = MarketController.to;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs() {
      final _ = [].cast<Widget>();
      for (int i = 0; i < (controller.data.data ?? []).length; i++) {
        final e = (controller.data.data ?? [])[i];
        _.add(Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
              color: controller.active == i
                  ? context.customTheme?.success
                  : context.customTheme?.bottomBar,
              borderRadius: 5.radius),
          height: 28,
          padding: const EdgeInsets.symmetric(
            horizontal: 11,
          ),
          child: Text(e.name ?? '',
              style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  color: controller.active == i
                      ? context.customTheme?.btnSuccess
                      : null)),
        ));
      }
      return _;
    }

    super.build(context);
    return Scaffold(
        body: SafeArea(
      child: ExtendedNestedScrollView(
        // onRefresh: () async {
        //   return Future.delayed(3000.milliseconds, () {});
        // },
        // controller: controller.scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                width: context.mediaQuerySize.width * .96,
                padding: const EdgeInsets.symmetric(vertical: 3),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: 17.radius,
                    border: Border.all(
                        width: 1,
                        color: context.customTheme?.btnSuccess ??
                            Colors.transparent)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 11),
                      child: Icon(
                        IconFont.sousuo,
                        size: 16,
                        color: context.customTheme?.subtitle,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      // color: Colors.red,
                      padding: const EdgeInsets.only(top: 6),
                      height: 30,
                      child: TextField(
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontSize: 14),
                        decoration: const InputDecoration(
                            isCollapsed: true,
                            border: InputBorder.none,
                            hintText: '搜索',
                            contentPadding: EdgeInsets.all(0)),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ];
        },
        body: Obx(
          () => controller.data.data != null
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 10),
                      child: TabBar(
                          onTap: controller.updateActive,
                          indicatorWeight: 0,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: const BoxDecoration(),
                          isScrollable: true,
                          controller: controller.tabController,
                          tabs: tabs()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('最新'),
                            Text('最热'),
                            Row(
                              children: [
                                Text('价格从高到低'),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: controller.tabController,
                          children: (controller.data.data ?? [])
                              .map((e) => MarketBoxComponent(
                                    data: e,
                                  ))
                              .toList()),
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ),
    )).onTap(() {
      FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  Widget child;
  CustomSliverPersistentHeader({required this.child});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

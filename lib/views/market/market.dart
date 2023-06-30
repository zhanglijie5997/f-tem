import 'package:art_app/components/custom_refresh/custom_refresh.dart';
import 'package:art_app/constants/constants.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/router/router.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/market/controller/controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
// import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:art_app/models/nft_market_get_plat_list/datum.dart';
import 'component/item.dart';

class MarketView extends StatefulWidget {
  const MarketView({super.key});

  @override
  State<MarketView> createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView>
    with AutomaticKeepAliveClientMixin {
  final controller = MarketController.to;

  List<Widget> tabs() {
    final _ = [].cast<Widget>();

    for (int i = 0; i < controller.tabList.length; i++) {
      final e = controller.tabList[i];
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

  List<Widget> tabView() {
    LogUtil.w('333');
    final List<Widget> _ = [];
    for (var i = 0; i < controller.tabList.length; i++) {
      final e = controller.tabList[i];
      _.add(MarketBoxComponent(
        key: controller.key[i],
        data: e,
      ));
    }

    return _;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SafeArea(
      child: CustomRefresh(
        controller: controller.scrollController,
        pinnedHeader: 70,
        onRefresh: () async {
          // LogUtil.w(
          //     'pageindex --> ${controller.key[controller.active].currentState?.source.pageIndex}');
          await Future.delayed(3000.milliseconds, () {
            controller.key[controller.active].currentState?.source.refresh();
          });
        },
        // controller: controller.scrollController,
        slivers: [
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
                      style:
                          context.textTheme.bodyMedium?.copyWith(fontSize: 14),
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
          ),
          SliverToBoxAdapter(
            child: Obx(
              () => controller.data.data != null
                  ? Padding(
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
                    )
                  : const SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Text('最新',
                              style: context.textTheme.bodyMedium?.copyWith(
                                  fontSize: 13,
                                  color: controller.secondTab == 0
                                      ? context.customTheme?.success
                                      : null)),
                        ).onTap(() {
                          controller.updateSecondTab(0);
                        }),
                        Padding(
                          padding: const EdgeInsets.only(right: 28.0),
                          child: Text('最热',
                              style: context.textTheme.bodyMedium?.copyWith(
                                  fontSize: 13,
                                  color: controller.secondTab == 1
                                      ? context.customTheme?.success
                                      : null)),
                        ).onTap(() {
                          controller.updateSecondTab(1);
                        }),
                        Row(
                          children: [
                            Text('价格从高到低',
                                style: context.textTheme.bodyMedium?.copyWith(
                                    fontSize: 13,
                                    color: controller.secondTab == 2
                                        ? context.customTheme?.success
                                        : null)),
                          ],
                        ).onTap(() {
                          controller.updateSecondTab(2);
                        }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
        befor: false,
        child: Obx(
          () => controller.data.data != null
              ? Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                          controller: controller.tabController,
                          children: tabView()),
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

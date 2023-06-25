import 'package:art_app/components/custom_refresh/custom_refresh.dart';
// import 'package:art_app/components/custom_tabbar/custom_tabbar.dart';
import 'package:art_app/constants/assets.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/router/router.dart';
import 'package:art_app/views/home/components/calender_collection.dart';
import 'package:art_app/views/home/components/first_collection.dart';
import 'package:art_app/views/home/controller/controller.dart';
// import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../components/custom_img/custom_img.dart';
// import 'package:share_plus/share_plus.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> with AutomaticKeepAliveClientMixin {
  final controller = HomeController.to;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SafeArea(
      child: Scrollbar(
          controller: controller.scrollController,
          child: CustomRefresh(
            onRefresh: controller.init,
            controller: controller.scrollController,
            slivers: [
              // 轮播图
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 140,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Obx(() => Swiper(
                          itemBuilder: (context, index) {
                            return ClipRRect(
                                borderRadius: 6.radius,
                                child: Image.network(
                                  controller
                                          .banner.data?[index].rotationChart ??
                                      '',
                                  fit: BoxFit.fill,
                                ));
                          },
                          itemCount: controller.banner.data?.length ?? 0,
                          itemWidth: double.infinity,
                          itemHeight: 280.0,
                          outer: false,
                          indicatorLayout: PageIndicatorLayout.SCALE,
                          pagination: const SwiperPagination()
                          // SwiperCustomPagination(
                          //     builder: (context, config){
                          //       return Container(width: 10, height: 10, color: Colors.red,);
                          //     },
                          //   )
                          )),
                    ),
                  ),
                ),
              ),
              // 金刚区
              SliverToBoxAdapter(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      minHeight: 64, maxHeight: 100, minWidth: double.infinity),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Obx(() => ListView.builder(
                          padding: const EdgeInsets.only(left: 19.0, top: 0),
                          itemBuilder: (c, i) => Container(
                            margin: const EdgeInsets.only(right: 29),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: 22.radius,
                                    child: SizedBox(
                                        width: 44,
                                        height: 44,
                                        child: Image.asset(
                                          controller.posList.data?[i].logoImg ??
                                              '',
                                          fit: BoxFit.contain,
                                        ))),
                                Text(
                                  controller.posList.data?[i].name ?? '',
                                  style: context.textTheme.bodyMedium
                                      ?.copyWith(fontSize: 13),
                                )
                              ],
                            ),
                          ),
                          itemCount: controller.posList.data?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                        )),
                  ),
                ),
              ),
              // 公告
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  height: 84,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 44),
                        child: Row(
                          children: [
                            Obx(
                              () => Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: (controller.announcementList.rows
                                                ?.length ??
                                            0) +
                                        1,
                                    itemBuilder: (c, i) => i ==
                                            (controller.announcementList.rows
                                                    ?.length ??
                                                0)
                                        ? SizedBox(
                                            width: 34,
                                            height: 84,
                                            child: Image.asset(
                                                Assets.assetsImagesMore),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0),
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                maxWidth: 120,
                                                minHeight: 78,
                                                maxHeight: 190,
                                                minWidth: 120,
                                              ),
                                              child: ClipRRect(
                                                borderRadius: 5.radius,
                                                child: Container(
                                                  color: context
                                                      .customTheme?.bottomBar,
                                                  // height: 78,
                                                  child: Column(
                                                    children: [
                                                      CustomImage(
                                                        url: controller
                                                                .announcementList
                                                                .rows?[i]
                                                                .imgUrl ??
                                                            '',
                                                        size:
                                                            const Size(120, 50),
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 8,
                                                            horizontal: 3,
                                                          ),
                                                          child: Text(
                                                            controller
                                                                    .announcementList
                                                                    .rows?[i]
                                                                    .title ??
                                                                '',
                                                            style: context
                                                                .textTheme
                                                                .bodyMedium
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        12),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            maxLines: 1,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ).onTap(() {
                                            Get.toNamed(
                                                "${RoutesName.announcementDetail}/${controller.announcementList.rows?[i].id}");
                                          })),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        // width: 34,
                        height: 84,
                        child: Image.asset(
                          Assets.assetsImagesAnnouncement,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Obx(
                    () => TabBar(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                        labelStyle: context.textTheme.bodyLarge?.copyWith(),
                        indicatorWeight: 3,
                        indicatorSize: TabBarIndicatorSize.tab,
                        unselectedLabelStyle: context.textTheme.bodyLarge
                            ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w400),
                        indicatorPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        indicator: BoxDecoration(
                            // borderRadius: 3.radius,
                            border: const Border(
                              bottom: BorderSide(
                                  width: 10, color: Colors.transparent),
                            ),
                            gradient: LinearGradient(
                                tileMode: TileMode.repeated,
                                colors: [
                                  '#E9BF84'.color(),
                                  '#FFF1E3'.color().withAlpha(0)
                                ])),
                        dividerColor: Colors.transparent,
                        controller: controller.tabbarController,
                        tabs: controller.tabs
                            .map((e) => UnconstrainedBox(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    color:
                                        context.theme.scaffoldBackgroundColor,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(e.name?.tr ?? '',
                                        style: context.textTheme.bodyLarge
                                            ?.copyWith(
                                                fontSize: 16,
                                                fontWeight:
                                                    controller.selectIndex ==
                                                            e.index
                                                        ? FontWeight.bold
                                                        : FontWeight.w400)),
                                  ),
                                ))
                            .toList()),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                      key: controller.pageStorageKey,
                      controller: controller.tabbarController,
                      children: const [
                        CalenderCollectionComponent(),
                        FirstCollectionComponent()
                      ]),
                )
              ],
            ),
          )),
    ));
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
    return Container(
      width: context.mediaQuerySize.width,
      color: context.theme.scaffoldBackgroundColor,
      child: child,
    );
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

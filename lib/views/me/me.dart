import 'package:art_app/components/custom_img/custom_img.dart';
import 'package:art_app/components/custom_login/custom_login.dart';
import 'package:art_app/constants/assets.dart';
import 'package:art_app/constants/constants.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/generated/locales.g.dart';
import 'package:art_app/models/app_login_phone/app_login_phone.dart';
import 'package:art_app/services/global/global.services.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/login/controller/controller.dart';
import 'package:art_app/views/me/components/all.dart';
import 'package:art_app/views/me/controller/controller.dart';
import 'package:art_app/views/me/services/services.dart';
import 'package:art_app/views/root/controller/controller.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class MeView extends StatefulWidget {
  const MeView({super.key});

  @override
  State<MeView> createState() => _MeViewState();
}

class _MeViewState extends State<MeView> with AutomaticKeepAliveClientMixin {
  final controller = Get.find<MeController>();
  Widget buildPulltoRefreshImage([PullToRefreshScrollNotificationInfo? info]) {
    var offset = info?.dragOffset ?? 0.0;
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            height: (220.0) + offset,
            width: double.infinity,
            child: Image.asset(
              Assets.assetsImagesMeBg,
              //fit: offset > 0.0 ? BoxFit.cover : BoxFit.fill,
              fit: BoxFit.cover,
            ),
          ),
          Obx(
            () => AnimatedOpacity(
              opacity: controller.opacity,
              duration: 20.milliseconds,
              child: Container(
                margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
                child: Column(
                  children: [
                    Container(
                      width: context.mediaQuerySize.width,
                      padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Badge(
                            backgroundColor: context.customTheme?.money,
                            child: SizedBox(
                              width: 24,
                              height: 21,
                              // color: Colors.red,
                              child: const Icon(IconFont.xingzhuangjiehe4)
                                  .onTap(() {
                                RootController.to.openDraw();
                              }),
                            ),
                          ),
                          Obx(
                            () => controller.loading
                                ? CustomLoginWidget(
                                    notLoginWidget: const SizedBox(),
                                    loginWidget: const Icon(
                                      IconFont.a_bianzu12,
                                      size: 21,
                                    ).onTap(
                                        GlobalServiceController.to.loginOut),
                                  )
                                : const CupertinoActivityIndicator(),
                          )
                        ],
                      ),
                    ),

                    // 个人信息
                    Obx(
                      () => Container(
                          width: context.mediaQuerySize.width,
                          padding: EdgeInsets.fromLTRB(25, 25 + offset, 25, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // 头像
                                  ClipRRect(
                                      borderRadius: 50.radius,
                                      child: CustomLoginWidget(
                                          loginWidget: CustomImage(
                                              url: GlobalServiceController.to
                                                      .userMsg.data?.avatar ??
                                                  '',
                                              size: Size(50, 50)),
                                          notLoginWidget: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Image.asset(Assets
                                                .assetsImagesDefaultAvatar),
                                          ))),
                                  // 名称，id
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: CustomLoginWidget(
                                      notLoginWidget: Text(
                                          LocaleKeys.clickLogin.tr,
                                          style: context.textTheme.labelLarge
                                              ?.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                      loginWidget: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            GlobalServiceController
                                                    .to.userMsg.data?.wxName ??
                                                '',
                                            style: context.customTheme?.body18,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  controller.nftAddress(
                                                      GlobalServiceController
                                                              .to
                                                              .userMsg
                                                              .data
                                                              ?.nftWalletAddress ??
                                                          ''),
                                                  style: context
                                                      .textTheme.bodyMedium
                                                      ?.copyWith(
                                                          color: context
                                                              .customTheme
                                                              ?.subtitle)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // 编辑个人资料
                              CustomLoginWidget(
                                notLoginWidget: const SizedBox(),
                                loginWidget: Row(
                                  children: [
                                    Text(LocaleKeys.userInformation.tr,
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                                color: context
                                                    .customTheme?.subtitle)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Icon(
                                        IconFont.you,
                                        size: 10,
                                        color: context.customTheme?.subtitle,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),

                    Container(
                      height: 46,
                      width: context.mediaQuerySize.width - 30,
                      // margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.assetsImagesOpenCashBg),
                              fit: BoxFit.fitWidth)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                  child: Image.asset(
                                      Assets.assetsImagesIconIconCash),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    LocaleKeys.myWallet.tr,
                                    style: context.textTheme.labelLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),

                          // 右侧

                          const Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: Icon(
                              IconFont.you,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      physics: const ClampingScrollPhysics(),
      itemBuilder: (c, i) => Text('$i'),
      itemCount: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: PullToRefreshNotification(
          pullBackOnRefresh: true,
          maxDragOffset: double.infinity,
          // refreshOffset: 40,
          reachToRefreshOffset: 60,
          armedDragUpCancel: false,
          //pullBackCurve: TestCurve(),
          pullBackDuration: const Duration(milliseconds: 200),
          onRefresh: () {
            controller.updateLoading(false);
            return Future.delayed(1000.milliseconds, () async {
              await GlobalServiceController.to.getUserInfo();
              controller.updateLoading(true);
              return true;
            });
          },
          child: ExtendedNestedScrollView(
            controller: controller.scrollController,
            pinnedHeaderSliverHeightBuilder: () {
              return context.mediaQueryPadding.top;
            },
            onlyOneScrollInBody: true,
            // ignore: avoid_unnecessary_containers
            body: Container(
              // margin: EdgeInsets.only(top: 30),
              // color: Colors.red,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 0),
                        margin: const EdgeInsets.only(left: 5),
                        width: 240,
                        child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            controller: controller.tabController,
                            indicatorWeight: 3,
                            labelStyle: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle:
                                context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                            indicatorPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            labelPadding: const EdgeInsets.only(bottom: 0),
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
                            tabs: controller.tabs
                                .map((e) => UnconstrainedBox(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 60,
                                        height: 40,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        color: context
                                            .theme.scaffoldBackgroundColor,
                                        child: Text(e.name ?? ''),
                                      ),
                                    ))
                                .toList()),
                      ),
                      Container(
                        // width: 65,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 26,
                        margin:
                            const EdgeInsets.only(left: 62, right: 15, top: 0),
                        decoration: BoxDecoration(
                            color: context.customTheme?.btnSuccess,
                            borderRadius: 22.radius),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconFont.sousuo,
                              size: 11,
                              color: context.customTheme?.subtitle,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(LocaleKeys.search.tr,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                              color: context
                                                  .customTheme?.subtitle))
                                  .onTap(() {
                                GlobalServiceController.to.toLogin(() {
                                  // 正常跳转
                                });
                              }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: TabBarView(
                          controller: controller.tabController,
                          children: [
                        MeAllComponent(type: ProductGetProductListType.all),
                        MeAllComponent(type: ProductGetProductListType.sale),
                        MeAllComponent(type: ProductGetProductListType.resale),
                        MeAllComponent(
                            type: ProductGetProductListType.synthesis),
                      ]))
                ],
              ),
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                PullToRefreshContainer(buildPulltoRefreshImage),
              ];
            },
            // pinnedHeaderSliverHeightBuilder: 0,
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

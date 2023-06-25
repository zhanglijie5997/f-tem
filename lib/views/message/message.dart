import 'package:art_app/components/custom_preview_img/custom_preview_img.dart';
import 'package:art_app/constants/assets.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/views/message/controller/controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
// import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView>
    with AutomaticKeepAliveClientMixin {
  final controller = MessageController.to;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: SafeArea(
            child: EasyRefresh(
      triggerAxis: Axis.vertical,
      header: const TaurusHeader(skyColor: Colors.black),
      footer: const NotLoadFooter(),
      onRefresh: () async {},
      onLoad: () async {
        return IndicatorResult.noMore;
      },
      child: Scrollbar(
        controller: controller.scrollController,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: 140,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                  child: Swiper(
                    itemBuilder: (context, index) {
                      return ClipRRect(
                          borderRadius: 6.radius,
                          child: CustomPreviewImg(
                              tag: 'tag$index',
                              path:
                                  "https://yanjie-prod-1318263237.cos.ap-shanghai.myqcloud.com/platform/banner/1665613216283230208.jpg"));
                    },
                    itemCount: 10,
                    itemWidth: double.infinity,
                    itemHeight: 280.0,
                    outer: false,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 64, maxHeight: 100, minWidth: double.infinity),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ListView.builder(
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
                                child: CustomPreviewImg(
                                    tag: 'tag$i',
                                    path:
                                        "https://yanjie-prod-1318263237.cos.ap-shanghai.myqcloud.com/platform/banner/1665613216283230208.jpg")),
                          )
                        ],
                      ),
                    ),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                height: 78,
                child: Stack(
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (c, i) => ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 120,
                                minHeight: 78,
                                maxHeight: 120,
                                minWidth: 120,
                              ),
                              child: const Text('dd'),
                            )),
                    const SizedBox(
                      child: Text('左边'),
                    )
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate:
                    CustomSliverPersistentHeader(child: const Text('data'))),

            SliverFillViewport(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 43,
                        maxWidth: 300,
                      ),
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                centerSlice: Rect.fromLTRB(20, 20, 38, 38),
                                image:
                                    AssetImage(Assets.assetsImagesChatBubule),
                                fit: BoxFit.fill),
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 200),
                            child: SelectionArea(
                                child: Text(
                              '1hello2233',
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(fontSize: 22),
                            )),
                          )),
                    ),
                  ],
                );
              }, childCount: 1),
              viewportFraction: 1,
            )
            // SliverFillViewport(delegate: delegate)
            //  SliverList.builder(
            // itemBuilder: (c, i) => Container(height: 1, color: Colors.red, child: Text('777'))
            // ),
          ],

          // ListView.builder(
          //   // physics: const ClampingScrollPhysics(),
          //   itemBuilder: (c, i) => Container(height: 50, color: Colors.red, child: Text('777'))
          // ),
        ),
      ),
    )));
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
  double get maxExtent => 200;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

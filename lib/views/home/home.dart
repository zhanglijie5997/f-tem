import 'package:art_app/components/custom_refresh/custom_refresh.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/views/home/controller/controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
// import 'package:art_app/generated/locales.g.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../components/custom_img/custom_img.dart';
import 'package:share_plus/share_plus.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}



class _HomeView extends State<HomeView> with AutomaticKeepAliveClientMixin{
  final controller = HomeController.to;

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
                          child: Image.network(
                            "https://yanjie-prod-1318263237.cos.ap-shanghai.myqcloud.com/platform/banner/1665613216283230208.jpg",
                            fit: BoxFit.fill,
                          ));
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
                              child: const SizedBox(
                                width: 44,
                                height: 44,
                                child: CustomImage(
                                  url: "https://yanjie-prod-1318263237.cos.ap-shanghai.myqcloud.com/platform/banner/1665613216283230208.jpg",
                                  size: Size(44, 44),
                                ),
                              ))
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
                    CustomSliverPersistentHeader(child: const Text('data').onTap(() {
                      Share.share('百度一下  https://www.baidu.com', subject: '百度');
                    }))),
            
                
            SliverFillViewport(
              delegate: SliverChildBuilderDelegate((context, index) {
                return CustomRefresh();
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
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

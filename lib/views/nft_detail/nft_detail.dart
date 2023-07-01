import 'package:art_app/components/custom_img/custom_img.dart';
import 'package:art_app/components/custom_refresh/custom_refresh.dart';
import 'package:art_app/constants/assets.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'controller/controller.dart';

class NftDetailView extends GetView<NftDetailController> {
  @override
  // ignore: overridden_fields
  final String tag = Get.parameters['id'] ?? '';
  NftDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // LogUtil.w(getImageSize(controller.par['image'] ?? ''));
    Widget buildPulltoRefreshImage(
        [PullToRefreshScrollNotificationInfo? info]) {
      var offset = (info?.dragOffset ?? 0.0);
      LogUtil.w(offset);

      return SliverToBoxAdapter(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            FutureBuilder(
                future: Utils.getImageSize(controller.par['image'] ?? ''),
                builder: (context, data) {
                  return Padding(
                    padding: EdgeInsets.only(top: offset),
                    child: AspectRatio(
                      aspectRatio:
                          (data.data?.width ?? 1) / (data.data?.height ?? 1),
                      child: SizedBox(
                          width: context.mediaQuerySize.width,
                          child: Hero(
                            tag: controller.par['id'] ?? '',
                            child: CustomImage(
                              fit: BoxFit.fitHeight,
                              url: controller.par['image'] ?? '',
                              size: Size(context.mediaQuerySize.width,
                                  double.infinity),
                            ),
                          )),
                    ),
                  );
                }),
          ],
        ),
      );
    }

    return Scaffold(
        body: CustomRefresh(
      customHeader: [PullToRefreshContainer(buildPulltoRefreshImage)],
      pinnedHeader: context.mediaQueryPadding.top,
      child: ListView.builder(itemBuilder: (c, i) => Text('$i')),
    ));
  }
}

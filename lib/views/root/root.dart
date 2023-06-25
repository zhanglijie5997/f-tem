import 'package:art_app/extension/context/context.dart';
import 'package:art_app/extension/widget/widget.ext.dart';
import 'package:art_app/router/router.dart';
// import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/root/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../components/custom_badge/custom_badge.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.key,
      drawer: Container(
        height: double.infinity,
        width: 190,
        color: context.theme.scaffoldBackgroundColor,
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: controller.orderList.length,
            itemBuilder: (c, i) {
              final tem = controller.orderList[i];
              return Padding(
                padding: const EdgeInsets.only(top: 40, left: 24),
                child: Row(
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset(tem.icon ?? ''),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        tem.name ?? '',
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontSize: 14),
                      ),
                    )
                  ],
                ),
              ).onTap(() {
                Get.toNamed(tem.page ?? '');
              });
            }),
      ),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: controller.list.map((e) => e.child).toList(),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            // SmartDialog.showLoading(animationType: SmartAnimationType.centerFade_otherSlide, displayTime: 10000.milliseconds);
            // ThemeServiceController.to.updateThemeMode(ThemeServiceController.to.themeModel == ThemeMode.dark ? ThemeMode.light :  ThemeMode.dark);
            // LanguageService.to.updateLanguage(
            //     LanguageService.to.language == const Locale('en', 'US')
            //         ? const Locale('zh', 'CN')
            //         : const Locale('en', 'US'));
            Get.toNamed(RoutesName.webview);
          },
          icon: const Icon(Icons.change_circle)),
      bottomNavigationBar: Obx(() => Container(
            color: context.customTheme?.bottomBar,
            padding: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            child: Row(
              children: controller.list
                  .map((e) => Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          height: 50,
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset(
                                        controller.active == e.index
                                            ? e.selectImg
                                            : e.img,
                                        fit: BoxFit.cover,
                                      )),
                                  Text(e.name.tr,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                              fontSize: 10,
                                              color: controller.active ==
                                                      e.index
                                                  ? context.customTheme?.success
                                                  : context.textTheme.bodyMedium
                                                      ?.color)),
                                ],
                              ),
                              Transform.translate(
                                offset: const Offset(10, 0),
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: (e.badge ?? 0) > 0
                                      ? QqBadge(
                                          text: '${e.badge}',
                                          radius: 6,
                                          onClearBadge: controller.cleanBadge,
                                          textStyle: const TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                              )
                            ],
                          ),
                        ).onTap(() {
                          controller.updateActive(e.index);
                        }),
                      ))
                  .toList(),
            ),
          )),
    );
  }
}

import 'package:art_app/extension/context/context.dart';
import 'package:art_app/extension/widget/widget.ext.dart';
import 'package:art_app/router/router.dart';
// import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/root/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Column(
                            children: [
                              SizedBox(
                                width: 20, height: 20,
                                child: Image.asset( controller.active == e.index ? e.selectImg : e.img)
                              ),
                              Text(e.name.tr,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                      fontSize: 12,
                                      color: controller.active == e.index
                                          ? context.customTheme?.success
                                          : context.textTheme.bodyMedium?.color)),
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


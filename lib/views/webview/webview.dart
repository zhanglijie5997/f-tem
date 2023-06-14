// import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/extension/extension.dart';
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/views/webview/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WebviewView extends GetView<WebviewController> {
  const WebviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.close).onTap(() {
            Get.back();
          }),
          title: Obx(() => Text(controller.title)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Icon(Icons.more_horiz_rounded).onTap(() {
                Get.bottomSheet(
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 100,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
                      decoration: BoxDecoration(
                        color: context.theme.scaffoldBackgroundColor,
                      ),
                      child: UnconstrainedBox(
                        child: Column(
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: context.mediaQuerySize.width,
                                minWidth: context.mediaQuerySize.width,
                                minHeight: 50,
                                maxHeight: 90
                              ),
                              child: ListView.builder(
                                padding:const EdgeInsets.all(20),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.options.length,
                                itemBuilder: (c, i) {
                                  final e = controller.options[i];
                                  return GestureDetector(
                                    onTap: () {
                                      print('object');
                                      Get.back();
                                      controller.optionsCallback(e);
                                    },
                                    child: Column(
                                      children: [
                                        e.icon,
                                        Text(e.name)
                                      ],
                                    )
                                  );
                                } 
                              ),
                            ),
                            TextButton(onPressed: () {
                              Get.back();
                            }, child: Text('取消', style: context.textTheme.bodyMedium?.copyWith(
                              color: context.customTheme?.success, fontSize: 18
                            )))
                          ],
                        ),
                      ),
                    ),
                  )
                );
              }),
            )
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              
              initialUrlRequest:
                  URLRequest(url: Uri.parse("https://www.theblockbeats.info/flash/149016")),
              initialOptions: controller.webViewOptions,
              onWebViewCreated: (c) {
                controller.webViewController = c;
              },
              androidOnPermissionRequest:
                  (controller, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              onLoadStart: (c, uri) async {
                print(await c.getUrl());
                controller.updateActive(false);
              },
              onLoadStop: (c, uri) async {
                LogUtil.i('加载完成');
                final title = await c.getTitle();
                controller.updateTitle(title ?? '');
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                var uri = navigationAction.request.url!;

                if (![
                  "http",
                  "https",
                  "file",
                  "chrome",
                  "data",
                  "javascript",
                  "about"
                ].contains(uri.scheme)) {
                  if (await canLaunchUrl(uri)) {
                    // Launch the App
                    await launchUrl(
                      uri,
                    );
                    // and cancel the request
                    return NavigationActionPolicy.CANCEL;
                  }
                }

                return NavigationActionPolicy.ALLOW;
              },
              onLoadError: (controller, url, code, message) {
                // pullToRefreshController.endRefreshing();
              },
              onProgressChanged: (c, progress) {
                print(progress);
                if (progress == 100) {
                  controller.updateProgress(progress.toDouble());
                  // pullToRefreshController.endRefreshing();
                }
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) {},
              onConsoleMessage: (controller, consoleMessage) {
                print(consoleMessage);
              },
            ),
            Obx(() => controller.active
                ? Center(
                    child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: context.customTheme?.success,
                    color: context.theme.scaffoldBackgroundColor,
                  ))
                : const SizedBox()),
            Obx(
              () => AnimatedSize(
                  duration: 300.milliseconds,
                  child: Container(
                    width: context.mediaQuery.size.width *
                        (controller.progress / 100),
                    height: 5,
                    decoration: BoxDecoration(
                        color: context.customTheme?.success,
                        borderRadius: 3.radius),
                  )),
            ),
          ],
        ));
  }
}

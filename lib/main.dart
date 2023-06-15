import 'dart:io';

import 'package:art_app/app.dart';
import 'package:art_app/db/db.tools.dart';
// import 'package:art_app/hook/notify_hook/notify_hook.dart';
import 'package:art_app/services/services.dart';
import 'package:art_app/utils/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'hook/notify_hook/notify_hook.dart';

void main() async {
  await StorageUtils.init();
  await AppServices.init();
  await DBInits.init();
  // await notifyHook.init();

  await NotificationController.initializeLocalNotifications();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      await serviceWorkerController
          .setServiceWorkerClient(AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      ));
    }
  }
  // ThemeServiceController.to.updateStatusBar();
  runApp(App());
}

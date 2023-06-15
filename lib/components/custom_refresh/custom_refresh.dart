import 'dart:async';

import 'package:art_app/extension/widget/widget.ext.dart';
import 'package:art_app/hook/notify_hook/notify_hook.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:art_app/hook/notify_hook/notify_hook.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CustomRefresh extends StatefulWidget {
  const CustomRefresh({super.key});

  @override
  State<CustomRefresh> createState() => _CustomRefreshState();
}

class _CustomRefreshState extends State<CustomRefresh> {
  final connectivityMap = {
    ConnectivityResult.none: const SizedBox(child: Text('无网络链接')),
    ConnectivityResult.wifi: const SizedBox(child: Text('wifi链接')),
    ConnectivityResult.mobile: const SizedBox(child: Text('手机流量')),
  };

  Widget _result = const SizedBox();

  StreamSubscription<ConnectivityResult>? subscription;

  Future<void> connectivityInit() async {
    final _ = await Connectivity().checkConnectivity();
    setState(() {
      _result = connectivityMap[_] ?? const SizedBox();
    });
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        _result = connectivityMap[result] ?? const SizedBox();
      });
    });
  }

  @override
  void initState() {
    connectivityInit();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _result).onTap(() async {
      // notifyHook.send();

      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      // if (!isAllowed) isAllowed = await displayNotificationRationale();
      if (!isAllowed) return;
      // NotificationUtils.createMessagingNotification(channelKey: 'big_picture', chatName: '测试', groupKey: '11', message: '11', username: 'zlj',);
      // NotificationUtils.showInboxNotification(555);
      NotificationUtils.showLowVibrationNotification(1111);
    //   await AwesomeNotifications().createNotification(
    //   content: NotificationContent(
    //     id: 1,
    //     channelKey: 'notification',
    //     title: 'test',
    //     body: 'test',
    //     actionType: ActionType.Default,
    //     category: NotificationCategory.Call,
    //   ),
    // );
    });
  }
}

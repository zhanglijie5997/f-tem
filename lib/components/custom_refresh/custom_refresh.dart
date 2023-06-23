import 'dart:async';

// import 'package:art_app/extension/widget/widget.ext.dart';
// import 'package:art_app/hook/notify_hook/notify_hook.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:art_app/hook/notify_hook/notify_hook.dart';
import 'package:art_app/extension/extension.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';

class CustomRefresh extends StatefulWidget {
  final Widget? child;
  final List<SliverToBoxAdapter>? slivers;
  final ScrollController controller;
  final Future<void> Function()? onRefresh;
  const CustomRefresh(
      {super.key,
      this.child,
      this.slivers,
      required this.controller,
      this.onRefresh});

  @override
  State<CustomRefresh> createState() => _CustomRefreshState();
}

class _CustomRefreshState extends State<CustomRefresh> {
  final connectivityMap = {
    ConnectivityResult.none: const SizedBox(child: Text('无网络链接')),
    ConnectivityResult.wifi: const SizedBox(child: Text('wifi链接')),
    ConnectivityResult.mobile: const SizedBox(child: Text('手机流量')),
  };
  final GlobalKey<PullToRefreshNotificationState> key =
      GlobalKey<PullToRefreshNotificationState>();
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
    return PullToRefreshNotification(
        notificationPredicate: (v) {
          return true;
        },
        pullBackDuration: 300.milliseconds,
        key: key,
        color: Colors.blue,
        onRefresh: () async {
          await widget.onRefresh?.call();
          return true;
        },
        pullBackOnRefresh: false,
        maxDragOffset: double.infinity,
        refreshOffset: 40,
        reachToRefreshOffset: 40,
        armedDragUpCancel: true,
        child: ExtendedNestedScrollView(
          controller: widget.controller,
          onlyOneScrollInBody: true,
          pinnedHeaderSliverHeightBuilder: () {
            return 0;
          },
          headerSliverBuilder: (c, f) => [
            PullToRefreshContainer((info) {
              var offset = info?.dragOffset ?? 0.0;
              Widget child = Container(
                alignment: Alignment.center,
                height: offset,
                // color: Colors.red,
                width: double.infinity,
                child: const CupertinoActivityIndicator(),
              );

              return SliverToBoxAdapter(
                child: child,
              );
            }),
            ...widget.slivers ?? [const SizedBox()],
          ],
          body: widget.child ?? _result,
        ));
//     Container(child: _result).onTap(() async {
//       // notifyHook.send();
//
//       bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//       // if (!isAllowed) isAllowed = await displayNotificationRationale();
//       if (!isAllowed) return;
//       // NotificationUtils.createMessagingNotification(channelKey: 'big_picture', chatName: '测试', groupKey: '11', message: '11', username: 'zlj',);
//       // NotificationUtils.showInboxNotification(555);
//       NotificationUtils.showLowVibrationNotification(1111);
//       //   await AwesomeNotifications().createNotification(
//       //   content: NotificationContent(
//       //     id: 1,
//       //     channelKey: 'notification',
//       //     title: 'test',
//       //     body: 'test',
//       //     actionType: ActionType.Default,
//       //     category: NotificationCategory.Call,
//       //   ),
//       // );
//     });
  }
}

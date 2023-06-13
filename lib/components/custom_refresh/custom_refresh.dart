import 'dart:async';

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
    return Container(child: _result);
  }
}

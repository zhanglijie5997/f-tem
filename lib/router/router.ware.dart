/*
 * @Author: zhanglijie5997 42401363+zhanglijie5997@users.noreply.github.com
 * @Date: 2023-03-11 22:50:45
 * @LastEditors: zhanglijie5997 42401363+zhanglijie5997@users.noreply.github.com
 * @LastEditTime: 2023-03-14 17:39:31
 * @FilePath: /jdn/lib/router/route_aware/route_aware.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:art_app/app.dart';
import 'package:flutter/material.dart';

abstract class RouteAwareState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(
        this, ModalRoute.of(context) as PageRoute); //Subscribe it here
    super.didChangeDependencies();
  }

  @override
  void didPush() {
    print('didPush $widget');
  }

  @override
  void didPopNext() {
    print('didPopNext $widget');
  }

  @override
  void didPop() {
    print('didPop $widget');
  }

  @override
  void didPushNext() {
    print('didPushNext $widget');
  }

  @override
  void dispose() {
    print("dispose $widget");
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}

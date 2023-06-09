/*
 * @Author: zhanglijie5997 42401363+zhanglijie5997@users.noreply.github.com
 * @Date: 2023-03-03 09:17:10
 * @LastEditors: zhanglijie5997 42401363+zhanglijie5997@users.noreply.github.com
 * @LastEditTime: 2023-03-13 18:50:09
 * @FilePath: /jdn/lib/extension/widget/widget.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget center() => Center(child: this);
  Widget padding(EdgeInsetsGeometry p) => Padding(padding: p, child: this);
  Widget margin(EdgeInsetsGeometry m) => Container(margin: m, child: this);
  Widget infinity() =>
      SizedBox(width: double.infinity, height: double.infinity, child: this);
  GestureDetector onTap(Function()? fn) => GestureDetector(
        onTap: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onDoubleTap(Function()? fn) => GestureDetector(
        onDoubleTap: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onLongPress(Function()? fn) => GestureDetector(
        onLongPress: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onLongPressMoveUpdate(
          Function(LongPressMoveUpdateDetails)? fn) =>
      GestureDetector(
        onLongPressMoveUpdate: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onLongPressCancel(Function()? fn) => GestureDetector(
        onLongPressCancel: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onLongPressUp(Function()? fn) => GestureDetector(
        onLongPressUp: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onLongPressDown(Function(LongPressDownDetails)? fn) =>
      GestureDetector(
        onLongPressDown: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onLongPressStart(Function(LongPressStartDetails)? fn) =>
      GestureDetector(
        onLongPressStart: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );
  GestureDetector onLongPressEnd(Function(LongPressEndDetails)? fn) =>
      GestureDetector(
        onLongPressEnd: fn,
        behavior: HitTestBehavior.opaque,
        child: this,
      );

  Transform rotate([double angle = -pi / 12]) {
    return Transform.rotate(
      angle: angle,
      child: this,
    );
  }
}

extension TextExtension on Text {
  TextStyle? styles([TextStyle? v]) => style?.merge(v);
  TextStyle? colors([Color? v]) => style?.copyWith(color: v);
}

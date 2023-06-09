import 'package:flutter/material.dart';

extension NumExt on int {
  Duration get days => Duration(days: this);

  Duration get hours => Duration(hours: this);

  Duration get minutes => Duration(minutes: this);

  Duration get seconds => Duration(seconds: this);

  Duration get milliseconds => Duration(milliseconds: this);

  Duration get microseconds => Duration(microseconds: this);

  DateTime get toDateTimeInMicroseconds =>
      DateTime.fromMicrosecondsSinceEpoch(this);

  DateTime get toDateTimeInMilliseconds =>
      DateTime.fromMillisecondsSinceEpoch(this);

  BorderRadius get radius => BorderRadius.all(Radius.circular(toDouble()));
}
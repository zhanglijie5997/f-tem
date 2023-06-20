import 'package:flutter/material.dart';

extension IntExt on int {
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

extension Numext on num {
  String get fileSizeFromBytes {
    const int kb = 1024;
    const int mb = 1024 * kb;
    const int gb = 1024 * mb;
    if (this >= gb) {
      return '${(this / gb).toStringAsFixed(2)} GB';
    }
    if (this >= mb) {
      return '${(this / mb).toStringAsFixed(2)} MB';
    }
    if (this >= kb) {
      return '${(this / kb).toStringAsFixed(2)} KB';
    }
    return '$this B';
  }
}

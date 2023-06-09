import 'package:flutter/material.dart';

extension StringExt on String {
  Color color() {
    String _ = this;
    _ = _.toUpperCase().replaceAll('#', '');
    if (_.length == 6) {
      _ = 'FF$_';
    }
    return Color(int.parse(_, radix: 16));
  }
}
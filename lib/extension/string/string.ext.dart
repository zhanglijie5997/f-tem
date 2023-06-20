import 'dart:convert';

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

  Map<String, dynamic> toJson() => jsonDecode(this);

  String removeFirst(Pattern pattern, [int startIndex = 0]) =>
      replaceFirst(pattern, '', startIndex);
  String removeAll(Pattern pattern) => replaceAll(pattern, '');
}

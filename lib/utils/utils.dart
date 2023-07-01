import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Utils {
  static Future<ui.Image> getImageSize(String url) async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    var image = Image.network(url);
    image.image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    return await completer.future;
  }
}

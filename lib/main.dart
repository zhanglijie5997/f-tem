import 'package:art_app/app.dart';
import 'package:art_app/services/services.dart';
import 'package:art_app/utils/storage/storage.dart';
import 'package:flutter/material.dart';

void main() async {
  await StorageUtils.init();
  await AppServices.init();
  // ThemeServiceController.to.updateStatusBar();
  runApp(const App());
}

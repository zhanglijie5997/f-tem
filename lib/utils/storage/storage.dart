// import 'package:art_app/utils/log/log.utils.dart';
import 'dart:convert';

import 'package:art_app/extension/extension.dart';
import 'package:art_app/extension/map/map.ext.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../config/config.dart';

abstract class StoreName {
  static String get TOKEN => 'TOKEN';
  static String get THEME => 'THEME';
  static String get USERMSG => 'USERMSG';
  static String get LANGUAGE => 'LANGUAGE';
  static String get SERVICEMODEL => 'SERVICEMODEL';
}

class StorageUtils {
  static GetStorage get box => GetStorage();

  static init() {
    return GetStorage.init();
  }

  static String get theme =>
      box.read<String>(StoreName.THEME) ?? ThemeMode.dark.name;

  static String get token => box.read<String>(StoreName.TOKEN) ?? '';

  static Map get userMsg => box.read(StoreName.USERMSG) ?? {};

  static String get language => box.read<String>(StoreName.LANGUAGE) ?? 'zh,CN';

  static ServiceModel get serviceModel =>
      ServiceModel.fromJson((box.read<String>(StoreName.SERVICEMODEL) ??
              Config.base.toJson().encode())
          .toJson());

  static void changeTheme(ThemeMode v) {
    StorageUtils.box.write(StoreName.THEME, v.name);
  }

  static void changeToken(String v) {
    StorageUtils.box.write(StoreName.TOKEN, v);
  }

  static void remove(String k) {
    StorageUtils.box.remove(k);
  }

  static changeUserMsg(v) {
    StorageUtils.box.write(StoreName.USERMSG, v);
  }

  /// example zh,CN
  static chanageLanguage(String v) {
    StorageUtils.box.write(StoreName.LANGUAGE, v);
  }

  static changeServiceModel(ServiceModel v) {
    box.write(StoreName.SERVICEMODEL, v.toString());
  }
}

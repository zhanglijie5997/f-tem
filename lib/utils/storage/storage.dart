// import 'package:art_app/utils/log/log.utils.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

abstract class StoreName {
  static String get TOKEN => 'TOKEN';
  static String get THEME => 'THEME';
  static String get USERMSG => 'USERMSG';
  static String get LANGUAGE => 'LANGUAGE';
}

class StorageUtils {
  static GetStorage get box => GetStorage();

  static init() {
    return GetStorage.init();
  }

  static String get theme => StorageUtils.box.read<String>(StoreName.THEME) ?? ThemeMode.dark.name;

  static String get token => StorageUtils.box.read<String>(StoreName.TOKEN) ?? '';

  static Map get userMsg => StorageUtils.box.read(StoreName.USERMSG) ?? {};

  static String get language => StorageUtils.box.read(StoreName.LANGUAGE) ?? 'zh,CN';

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
  
}
import 'package:art_app/utils/log/log.utils.dart';
import 'package:art_app/utils/storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageService extends GetxService {
  static LanguageService get to => Get.find<LanguageService>(); 

  final _language = (const Locale('zh', 'CN')).obs;
  Locale get language => _language.value;

  updateLanguage(Locale v) {
    _language.value = v;
   
    Get.updateLocale(v);
    StorageUtils.chanageLanguage('${v.languageCode},${v.countryCode}');
  }

  @override
  void onInit() {
    final local = StorageUtils.language;
    LogUtil.w(local);
    if (local.contains(',')) {
      final list = local.split(',');
      LogUtil.w(list);
      _language.value = Locale(list[0], list[1]);
    }
    
    super.onInit();
  }
}